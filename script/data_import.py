import pandas as pd

controls_file_name = "800-53-rev4-controls.xlsx"
test_file_name = "800-53a-rev4-objectives.xlsx"
base_path = "../public/"
controls_sheet_name = "800-53-rev4-controls"
use_cols = "A:O"
test_file_out = "800-53a-r4.xlsx"
controls_file_out = "800-53-r4.xlsx"

cf = pd.read_excel(base_path + controls_file_name, usecols=use_cols)
cf = cf.ffill()
cf = cf.fillna("None")

tf = pd.read_excel(base_path + test_file_name, usecols="A:G")
tf = tf.ffill()
tf = tf.fillna("None")



tf.to_excel(base_path+test_file_out)
cf.to_excel(base_path+controls_file_out)