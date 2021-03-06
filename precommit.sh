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

# Build the website into a docker image

set -e

JENKINS_DIR=`dirname "$0"`
PRJ_HOME=`cd ${JENKINS_DIR};pwd`
PROFILE=${1}

cd ${PRJ_HOME}

mvn -B -ntp -q -pl pulsar-flink-1.9 clean license:check install checkstyle:check spotbugs:check -P${PROFILE}
cat pulsar-flink-1.9/target/surefire-reports/*.txt
mvn -B -ntp -q -pl pulsar-flink-1.11 clean license:check install checkstyle:check spotbugs:check -P${PROFILE}
cat pulsar-flink-1.11/target/surefire-reports/*.txt
retcode=$?
exit $retcode
