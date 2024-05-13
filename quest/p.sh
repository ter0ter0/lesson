#! /bin/bash

 read -p "サービス名を入力してください:" service_name

                        if [ "$service_name" = "hoge" ]; then

                                echo "サービス名：hoge"
                                echo "ユーザー名：fuga"
                                echo "パスワード：piyo"

                        else
                                echo "そのサービスは登録されていません。"


                        fi
