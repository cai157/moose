import numpy
import math
from vtk import vtkDataSetReader
from vtk.util import numpy_support as VN
reader = vtkDataSetReader()
reader.SetFileName("10_paper.vtk")
reader.ReadAllVectorsOn()
reader.ReadAllScalarsOn()
reader.Update()
euler_angle_data = reader.GetOutput()
ncells = euler_angle_data.GetNumberOfCells()
euler_angle_matrix = VN.vtk_to_numpy(euler_angle_data.GetCellData().GetArray('EulerAngles'))
euler_angle_matrix = (180/math.pi) * euler_angle_matrix
euler_angle_file_out = open("euler_ang_file.txt","w")
for j in range(ncells):
	euler_angle_file_out.write(str(euler_angle_matrix[j,0]))
	euler_angle_file_out.write(" ")
	euler_angle_file_out.write(str(euler_angle_matrix[j,1]))
	euler_angle_file_out.write(" ")
	euler_angle_file_out.write(str(euler_angle_matrix[j,2]))
	euler_angle_file_out.write("\n")
euler_angle_file_out.close()
