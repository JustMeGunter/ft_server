#!\bin\bash
curl --request POST \
	  --url http://localhost:8000/test \
	    --header 'content-type: application/json' \
	      --data '{
	"msg": "testing"
}'
{"code":"success","payload":[{"msg":"testing","id":"dc0e2c2b-793d-433c-8645-b3a553ea26de","createDate":"2020-09-01T17:36:09.897Z"}]}
