#ifndef CALLBACKSINK_H
#define CALLBACKSINK_H

#ifndef  Q_MOC_RUN
#include <boost/iostreams/concepts.hpp>
#include <boost/iostreams/stream_buffer.hpp>
#endif

#include <functional>
#include <string>

/**
 * @brief An output sink which uses a custom callback.
 */
class CallbackSink : public boost::iostreams::sink
{
public:
    typedef std::function<void(const std::string &)> Callback;
    typedef boost::iostreams::stream_buffer<CallbackSink> Buffer;

    CallbackSink(Callback callback) : m_callback(callback)
    {
    }

    std::streamsize write(const char* s, std::streamsize n)
    {
        m_callback(std::string(s, n));
        return n;
    }

private:
    Callback m_callback;
};

#endif // CALLBACKSINK_H
