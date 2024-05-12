#! /bin/bash  
echo "パスワードマネージャーへようこそ！"

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" str

        case "$str" in

        "Add Password")

	 	read -p "サービス名を入力してください:" service_name

		read -p "ユーザー名を入力してください:"  user_name

		read -p "パスワードを入力してください:" passward


		echo "${service_name}" >>service_name.txt
		echo "${user_name}">>user_name.txt
		echo "${passward}">>passward.txt

        ;;
esac





