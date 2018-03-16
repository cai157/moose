#* This file is part of the MOOSE framework
#* https://www.mooseframework.org
#*
#* All rights reserved, see COPYRIGHT for full restrictions
#* https://github.com/idaholab/moose/blob/master/COPYRIGHT
#*
#* Licensed under LGPL 2.1, please see LICENSE for details
#* https://www.gnu.org/licenses/lgpl-2.1.html

from TestHarness.schedulers.Scheduler import Scheduler
from TestHarness import util

class RunParallel(Scheduler):
    """
    RunParallel is a Scheduler plugin responsible for executing a tester
    command and doing something with its output.
    """
    @staticmethod
    def validParams():
        params = Scheduler.validParams()
        return params

    def __init__(self, harness, params):
        Scheduler.__init__(self, harness, params)

    def run(self, job_container):
        """ Run a tester command """
        tester = job_container.getTester()

        # Launch and wait for the command to finish
        if tester.shouldExecute():
            job_container.run()

        # Was this test already considered finished? (Timeouts, Dry Run)
        if tester.isFinished():
            return

        output = job_container.getOutput()

        # If we are doing recover tests
        if self.options.enable_recover and tester.specs.isValid('skip_checks') and tester.specs['skip_checks']:
            tester.setStatus('PART1', tester.bucket_success)
            return
        else:
            # Process the results and beautify the output
            self.testOutput(job_container, output)

    def testOutput(self, job_container, output):
        """ Process results generated by the executed command """
        tester = job_container.getTester()

        # Allow derived proccessResults to process the output and set a status
        output = tester.processResults(tester.getMooseDir(), self.options, output)

        # See if there's already a failing status set on this test. If there is, we shouldn't attempt to
        # read from the redirected output files.
        if not tester.didFail():
            # Read the output either from the temporary file or redirected files
            if tester.hasRedirectedOutput(self.options):
                redirected_output = util.getOutputFromFiles(tester, self.options)
                output += redirected_output

                # If we asked for redirected output but none was found, we'll call that a failure
                if redirected_output == '':
                    tester.setStatus('FILE TIMEOUT', tester.bucket_fail)
                    output += '\n' + "#"*80 + '\nTester failed, reason: ' + tester.getStatusMessage() + '\n'

        else:
            output += '\n' + "#"*80 + '\nTester failed, reason: ' + tester.getStatusMessage() + '\n'

        # Set testers output with modifications made above so it prints the way we want it
        job_container.setOutput(output)