# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

def AssertRunScript(info, name, arg):
  info.script.AppendExtra(('assert(run_program("/tmp/install/bin/%s", "%s") == 0);' % (name, arg)))

def FullOTA_PostValidate(info):
  """Mount the partitions"""
  info.script.Mount("/system")
  info.script.Mount("/vendor")
  info.script.AppendExtra('mount("ext4", "EMMC", "/dev/block/bootdevice/by-name/modem", "/firmware", "");')
  """extract_firmware.sh"""
  info.script.Print("Extracting modem firmware")
  AssertRunScript(info, "extract_firmware.sh", "")
  info.script.Print("Firmware extracted")
  """wrap_shims.sh"""
  info.script.Print( "Wrapping shims")
  AssertRunScript(info, "wrap_shims.sh", "")
  info.script.Print("Shims wrapped")
  """update_build_prop.sh"""
  info.script.Print("Updating build props")
  AssertRunScript(info, "update_build_prop.sh", "")
  info.script.Print("Build props updated")
  """Unmount the partitions"""
  info.script.Unmount("/system")
  info.script.Unmount("/vendor")
  info.script.AppendExtra('unmount("/firmware");')
