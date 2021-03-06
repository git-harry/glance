#
# Cookbook Name:: glance
# Recipe:: default
#
# Copyright 2012, Rackspace US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

template "/etc/rsyslog.d/22-glance.conf" do
    source "22-glance.conf.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(
        "use_syslog" => node["glance"]["syslog"]["use"],
        "log_facility" => node["glance"]["syslog"]["config_facility"]
    )
    only_if { node["glance"]["syslog"]["use"]  }
    notifies :restart, "service[rsyslog]", :immediately
end
