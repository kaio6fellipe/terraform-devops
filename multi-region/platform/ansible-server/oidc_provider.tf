resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

# % HOST=$(curl https://vstoken.actions.githubusercontent.com/.well-known/openid-configuration \
# | jq -r '.jwks_uri | split("/")[2]')
# % echo | openssl s_client -servername $HOST -showcerts -connect $HOST:443 2> /dev/null \
# | sed -n -e '/BEGIN/h' -e '/BEGIN/,/END/H' -e '$x' -e '$p' | tail +2 \
# | openssl x509 -fingerprint -noout \
# | sed -e "s/.*=//" -e "s/://g" \
# | tr "ABCDEF" "abcdef"

  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}