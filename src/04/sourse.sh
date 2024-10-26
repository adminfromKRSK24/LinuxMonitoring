#! /bin/bash

function f_ip {
    ip=$(($RANDOM % 255 + 1)).$(($RANDOM % 255 + 1)).$(($RANDOM % 255 + 1)).$(($RANDOM % 255 + 1))
    echo $ip
}

function f_date {
    date=`date '+%d/%b/%Y:%T %z'`
    echo "$date"
}

function f_method {
   methods=("GET" "POST" "PUT" "PATCH" "DELETE")
   method_number=$(($RANDOM % 5))
   echo "${methods[$method_number]}"
}

function f_response {
   response=(200 201 400 401 403 404 500 501 502 503)
   response_number=$(($RANDOM % 10))
   echo "${response[$response_number]}"
}

function f_agents {
    agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
    agent_number=$(($RANDOM % 8))
   echo "${agents[$agent_number]}"
}

function f_url {
   methods=("youtube.com" "github.com" "vk.com" "google.com" "yandex.ru" "twitter.com")
   method_number=$(($RANDOM % 5))
   echo "${methods[$method_number]}"
}

#200 OK - успешный запрос.
#201 Created - был создан новый ресурс.
#400 Bad Request - сервер обнаружил в запросе клиента синтаксическую ошибку.
#401 Unauthorized - для доступа к запрашиваемому ресурсу требуется аутентификация.
#403 Forbidden - сервер понял запрос, но он отказывается его выполнять из-за ограничений в доступе для клиента к указанному ресурсу.
#404 Not Found - Сервер понял запрос, но не нашёл соответствующего ресурса по указанному URL.
#500 Internal Server Error — любая внутренняя ошибка сервера.
#501 Not Implemented - сервер не поддерживает возможностей, необходимых для обработки запроса.
#502 Bad Gateway - сервер, выступая в роли шлюза или прокси-сервера, получил недействительное ответное сообщение от вышестоящего сервера.
#503 Service Unavailable - сервер временно не имеет возможности обрабатывать запросы по техническим причинам.