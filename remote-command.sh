COMM_SERVER_IP=$1
COMM_SERVER_NO=$2
ssh -i Ample-Load-Testing-Keypair.pem ubuntu@10.68.2."$COMM_SERVER_IP" "grep \"heartbeat\" /var/log/host$COMM_SERVER_IP\"_comm\"$COMM_SERVER_NO/commserver.log" 
