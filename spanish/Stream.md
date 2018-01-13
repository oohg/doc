## Clase TStream

La clase TStream está diseñada para simplificar el manejo de flujos de datos.
Permite recibir y enviar datos en bruto desde "cualquier" fuente, almacenarlos y suministrarlos en forma regulada.
Por ejemplo, es posible guardarlos hasta recibir un caracter de fin de línea o hasta que se alcance una cantidad específica.

Utilizando la flexibilidad de las clases, es posible utilizar el mismo código para procesar datos desde diferentes fuentes (un archivo, un socket de red, un puerto serial o la memoria).
Otro uso es la descompresión o conversión de datos.

Las clases de ejemplo son:
* TStreamBase:   Lee datos secuencialmente o línea a línea desde un buffer en memoria. Vea TStream.prg
* TStreamFile:   Lee datos desde un archivo. Vea TStream.prg
* TStreamSocket: Lee/escribe datos desde un socket de red. Vea TStreamSocket.prg
* TStreamSerial: Lee/escribe datos desde un puerto serial. Vea TStreamSerial.prg
* TStreamSSL:    Lee/escribe datos desde una conección SSL (requiere la librería OpenSSL). Vea TStreamSSL.prg
* TStreamUnZip:  Lee datos comprimidos y los retorna sin comprimir. Vea TStreamZip.prg

Vea en TSmtpClient.prg un ejemplo básico de cliente SMTP utilizando la clase TStreamSocket.
