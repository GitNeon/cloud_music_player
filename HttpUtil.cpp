#include "HttpUtil.h"
#include <QDebug>
#include <QNetworkReply>

HttpUtil::HttpUtil(QObject *parent) : QObject(parent)
{
    manager = new QNetworkAccessManager(this);
    //    QObject::connect(manager, &QNetworkAccessManager::finished, this, &HttpUtil::replySignal);
    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)), this, SLOT(httpResponse(QNetWorkReply*)));
}

void HttpUtil::httpRequest(QString method,QString url) {
    if(method.compare("GET", Qt::CaseInsensitive) == 0) {
        QNetworkRequest request;
        request.setUrl(QUrl(BASE_URL + url));
        manager->get(request);
    }
}

void HttpUtil::httpResponse(QNetworkReply *reply) {
    QString result = reply->readAll();
    emit replySignal(result);
}

HttpUtil::~HttpUtil() {
    delete manager;
}
