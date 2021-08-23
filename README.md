## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Topology](Images/unit13_finaltopology.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above or select portions of the filebeat_pb.yml file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic flow to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.

| Name     | Function              | IP Address | Operating System |
|----------|-----------------------|------------|------------------|
| Jump Box | Gateway - Ansible     | 10.0.0.4   | Ubuntu 18.04     |
| Web-1    | WebHost - Container   | 10.0.0.5   | Ubuntu 18.04     |
| Web-2    | WebHost - Container   | 10.0.0.6   | Ubuntu 18.04     |
| Web-3    | WebHost - Container   | 10.0.0.7   | Ubuntu 18.04     |
| Web-4    | WebHost - Container   | 10.0.0.8   | Ubuntu 18.04     |
| ELK-1    | ELK Stack - Container | 10.2.0.4   | Ubuntu 18.04     |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from my private IP address, hereby referred to as <my_ip>

Machines within the network can only be accessed by first connecting to the Jump Box. All WebHost VMs [10.0.0.5-10.0.0.8] are able to communicate with the ELK-1 host [10.2.0.4].

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | <my_ip>              |
| WebHosts | No                  | 10.0.0.4             |
| ELK-1    | Yes                 | 10.0.0.*, <my_ip>    |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous as it allows for numerous instances of the same configuration to be created quickly and easily. It also allows for simple updating across the fleet at a later date.

The playbook implements the following tasks:
- Install Docker
- Install Pip
- Install Pip Docker
- Install DVWA
- Enable Docker

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker PS Post ELK Install](Images/docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 [10.0.0.5]
- Web-2 [10.0.0.6]
- Web-3 [10.0.0.7]
- Web-4 [10.0.0.8]

We have installed the following Beats on these machines:
- FileBeats
- MetricBeats

These Beats allow us to collect the following information from each machine:
- Filebeat collects logfiles created by the host system such as WinEventLogs which may include information regarding successful or failed authentication attempts.
- Metricbeat monitors statistics and metrics of the host system as as bandwidth, throughput, cpu utilisation and many more.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
1. Copy the filebeat_pb.yml file to /etc/ansible/roles (Note that there are also playbooks included for the installation of MetricBeat and ELK - these instructions are applicable for all playbooks changing variables where required)
2. Copy the filebeat_config.yml file to /etc/ansible/roles (this is the config file required by the FileBeat playbook)
3. Update the /etc/ansible/hosts file to include your target hosts, typically under the correct group header.
4. Run the playbook, and navigate to the IP of the target host/s (ie 10.0.0.5) to check that the installation worked as expected.

### Step by step command line instruction
1. Shell into your Ansible instance.
2. # curl https://filebeat_pb.yml > /etc/ansible/roles/filebeat_pb.yml
3. # curl https://filebeat_config.yml > /etc/ansible/roles/filebeat_config.yml
3. # nano /etc/ansible/hosts
4. Add hosts and python suffix as demonstrated, then save and exit nano:
	[webservers]
	10.0.0.5 ansible_python_interpreter=/usr/bin/python3
	10.0.0.6 ansible_python_interpreter=/usr/bin/python3
5. # ansible-playbook /etc/ansible/roles/filebeat_pb.yml
6. The process shjould complete and diplay similar to the below:
![Successful FileBeat Playbook](Images/filebeat_pb.png)
