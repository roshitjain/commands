# Script to extract logs from any comm server  
COMM_SERVER_IP=$1
COMM_SERVER_NO=$2
SSH_KEY_PATH=$3
ssh -i $SSH_KEY_PATH ubuntu@10.68.2."$COMM_SERVER_IP" "grep \"type=\\\"heartbeat\\\"\" /var/log/host$COMM_SERVER_IP\"_comm\"$COMM_SERVER_NO/commserver.log" 
