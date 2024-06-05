#! /bin/bash  
echo "パスワードマネージャーへようこそ！"
echo "GPGで設定したメールアドレスを入力して下さい"
read gpg_email
gpg_email="${gpg_email:?GPGのメールアドレスを入力して下さい}"

if [ "$gpg_email" = "panicdepanic@gmail.com" ]; then

	while [ "$input" != "Exit" ]; do
	read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" input
        	case "$input" in

        	"Add Password")

	 		read -p "サービス名を入力してください:" service_name
			read -p "ユーザー名を入力してください:"  user_name
			read -p "パスワードを入力してください:" password
			sudo  gpg -d password.gpg > password.txt 2> /dev/null

				if [ $? -eq 0 ]; then
					echo "複合化されました"
				else
					echo "複合化されませんでした"
				exit 1
				fi

			echo "${service_name}:${user_name}:${password}">password.txt

			sudo  gpg -e -a -r "${gpg_email}" -o password.gpg password.txt

				if [ $? -eq 0 ]; then
					echo "パスワードが追加され暗号化されました。"
				else
					echo "パスワードの保存に失敗しました。"
				fi
			;;

		"Get Password")

			read -p "サービス名を入力してください:" service_name
				pas=$(grep "^$service_name:" password.txt | cut -d: -f1)


				if [ "$service_name" = "$pas" ]; then
					read -p "ファイルを複合化しますか？: y or n" input

					case "$input" in
					"y")
						echo "ファイルを複合化します"
						sudo gpg -d password.gpg > password.txt 2> /dev/null

					echo "サービス名：$(grep "^$service_name:" password.txt | cut -d: -f1)"
					echo "ユーザー名：$(grep "^$service_name:" password.txt | cut -d: -f2)"
					echo "パスワード：$(grep "^$service_name:" password.txt | cut -d: -f3)"

					;;

					"n")
						echo "Thank you"
						exit 0
					;;
					esac

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

else
	echo "メールアドレスが違います"
	exit 1

fi
