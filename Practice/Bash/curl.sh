token1="$(curl --location --request POST 'http://auth.dev.builtwith.solar/auth/realms/N-able/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=joshua.brown@n-able.com' \
--data-urlencode 'password=password' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=rest-client' | jq -r '.access_token')"

users="$(curl --location --request GET 'http://auth.dev.builtwith.solar/auth/admin/realms/N-able/users' \
--header "Authorization: Bearer $token1" | jq -r ".[].id")"
users_name="$(curl --location --request GET 'http://auth.dev.builtwith.solar/auth/admin/realms/N-able/users' \
--header "Authorization: Bearer $token1" | jq -r ".[].id")"


for username in $users ; do

groups="$(curl --location --request GET 'http://auth.dev.builtwith.solar/auth/admin/realms/N-able/users/'$username'/groups' \
--header "Authorization: Bearer $token1" | jq -r ".[].path")"

echo $users_name



done



# # This is working. just removing it
# for username in $users ; do
# azure_username="$(az ad user list --upn $username | jq -r ".[].accountEnabled")"
# echo "$username is currently set to $azure_username" 
# done