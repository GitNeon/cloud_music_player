#ifndef HTTPUTIL_H
#define HTTPUTIL_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QtQml/qqmlregistration.h>

class HttpUtil : public QObject {
    Q_OBJECT // 使用Q_OBJECT宏
    QML_ELEMENT // 标记此类并导出到qml中
public:
    // 必须显式调用，防止编译器进行隐式类型转换
    explicit HttpUtil(QObject *parent = nullptr);
    ~HttpUtil();

    // 使用Q_INVOKABLE将类中的成员方法暴露给Qt的元对象系统
    // 以便在qml中调用这些方法
    Q_INVOKABLE void httpRequest(QString method, QString url);
    Q_INVOKABLE void httpResponse(QNetworkReply *reply);
private:
    QNetworkAccessManager* manager;
    QString BASE_URL = "http://localhost:3000/api";
signals:
    void replySignal(QString reply);
};

#endif // HTTPUTIL_H