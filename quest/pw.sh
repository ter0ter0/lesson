#! /bin/bash  
echo "パスワードマネージャーへようこそ！"
while [ "$input" != "Exit" ]; do
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" input
        case "$input" in

        "Add Password")

	 	read -p "サービス名を入力してください:" service_name
		read -p "ユーザー名を入力してください:"  user_name
		read -p "パスワードを入力してください:" passward

		echo "${service_name}" >>service_name.txt
		echo "${user_name}">>user_name.txt
		echo "${passward}">>passward.txt
		echo "パスワードの追加は成功しました。"

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

		echo "Thak you!"
		exit
		;;

	*)
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
		;;
	esac
done



