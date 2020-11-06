using System;

public class CircularBuffer<T>
{
    T [] _buffer;
    int _capacity = 0;
    int _readIdx = 0;
    int _writeIdx = 0;
    int _size = 0;
    public CircularBuffer(int capacity)
    {
        _buffer = new T[capacity];
        _size = 0;
        _capacity = capacity;
        _readIdx = 0;
        _writeIdx = 0;
    }

    public T Read()
    {
        if(_size == 0) throw new InvalidOperationException();
        _size --;
        T el = _buffer[_readIdx];
        _readIdx ++;
        if(_readIdx >= _capacity) _readIdx  = 0;
        return el;

    }

    public void Write(T value)
    {
        if(_size == _capacity) throw new InvalidOperationException();
        _size ++;
        _buffer[_writeIdx] = value;
        _writeIdx ++;
        if(_writeIdx >= _capacity) _writeIdx = 0;
    }

    public void Overwrite(T value)
    {
        if(_size < _capacity) {
            _size ++;
            _buffer[_writeIdx] = value;
            _writeIdx ++;
            if(_writeIdx >= _capacity) _writeIdx = 0;
        } else {
            _buffer[_readIdx] = value;
            _readIdx ++;
            if(_readIdx >= _capacity) _readIdx = 0;
        }
    }

    public void Clear()
    {
        _size = 0;
        _readIdx = 0;
        _writeIdx = 0;
    }
}