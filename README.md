To use a docker image target, ensure `connection: local` is not set. Other than that I used the inventory file to set the `ansible_port`, but it might be okay to do by some other means.

This is the command I ran:
```
ansible-playbook -e "ansible_port=8022" -i hosts.yaml ./playbooks/0_essentials.yaml -K
```
