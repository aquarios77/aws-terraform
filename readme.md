# to be able to manage a node from an ansible control node you need to configure an SSH
# on the control node run
ssh-keygen
# just hit enter to all prompts
# the key will be save to the ~/.ssh/id_rsa where "id_rsa" is a private key and "id_rsa.pub" is a public key that needs to be copied to all ansible managed nodes (one of them is a "tomcat" node from our example)
# the login will be attempted with the username of the currently logged in user, just provide the password if the user with the same username exists on the ansible managed node
ssh-copy-id <ip-address-of-ansible-managed-node>
# now you will be able to connect using the private key (without the need to specify te password)
ssh <ip-address-of-ansible-managed-node>
# ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1 can be tried to automatically create keys