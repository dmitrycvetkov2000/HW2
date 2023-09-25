MODULE="Modules/NewsApiNetworking/Sources/NewsApiNetworking"
openapi-generator generate -i "spec.json" -g swift5 -o "spec"
rm -r $MODULE""*
cp -R "spec/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "spec"
