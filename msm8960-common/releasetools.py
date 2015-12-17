# Copyright (C) 2012 The Android Open Source Project
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

import common



	
def FullOTA_Assertions(self):
	end(self)

def IncrementalOTA_Assertions(self):
	end(self)
	
	
def end(self):
	self.script.AppendExtra('ui_print("=====================");')
	self.script.AppendExtra('ui_print("    Thanks for install");')
	self.script.AppendExtra('ui_print("    Support: Le Hoang");')
	self.script.AppendExtra('ui_print("    l.hoang87@live.com");')
	self.script.AppendExtra('ui_print("    vegaviet.com");')
	self.script.AppendExtra('ui_print("=====================");')


