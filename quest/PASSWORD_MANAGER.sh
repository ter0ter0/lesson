#! /bin/bash  
echo "パスワードマネージャーへようこそ！"
echo "GPGで設定したメールアドレスを入力して下さい"
read gpg_email
gpg_email="${gpg_email:?GPGのメールアドレスを入力して下さい}"

while [ "$input" != "Exit" ]; do
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" input
        case "$input" in

        "Add Password")

	 	read -p "サービス名を入力してください:" service_name
		read -p "ユーザー名を入力してください:"  user_name
		read -p "パスワードを入力してください:" password
		sudo  gpg -d password.gpg > password.txt 2> /dev/null

		echo "${service_name}" >>service_name.txt
		echo "${user_name}">>user_name.txt
		echo "${password}">>password.txt
		sudo  gpg -e -a -r "${gpg_email}" -o password.gpg password.txt

		if [ $? -eq 0 ]; then
			echo "パスワードが追加され暗号化されました。"
		else
			echo "パスワードの保存に失敗しました。"
		fi
		;;

	"Get Password")

		read -p "サービス名を入力してください:" service_name

			if [ "$service_name" = "hoge" ]
			then

				echo "サービス名：hoge"
				echo "ユーザー名：fuga"
				echo "パスワード：piyo"

			else
				echo "そのサービスは登録されていません。"
			fi
		;;

	"Exit")

		echo "Thank you!"
		exit
		;;

	*)
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
		;;
	esac
done



