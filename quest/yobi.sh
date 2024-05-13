read -p  "サービス名を入力してください:" service_name

read -p "ユーザー名を入力してください"  user_name

read -p "パスワードを入力してください" passward


echo ${service_name} >>service_name.txt
echo ${user_name}>>user_name.txt
echo ${passward}>>passward.txt



echo "Thank you"
