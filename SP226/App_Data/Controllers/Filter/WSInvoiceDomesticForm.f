<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "WSInvoiceDomestic">
  <!ENTITY DetailTable "d71">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">
]>

<dir table="m71$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn mua hàng trong nước" e="Domestic Purchase Invoice"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%sw9VN51M7dUFsnKYhwf0Q/HuCYrC4FPiH3o/E+UueEluzjQ9X1OKdftbrDIiBqqX</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+DsOWKSFUolPNMZmdzAJpp6QbN1dSy0d50M+TWQxQhqB0PXC5qtP/Kzt1m69VjZ5izy8XsUbyMEGMFcMA/45rI8lud1WVe+HE3c2UleoG2Liz7CeknCM7ID3Zj/davS37LvhfaWw4PEULOpmHzs4uGloRAQEOijWrrhT8fAAoeH6C1jbg491jE2q+LkWAm+1hLbPn4KdKsQysVqyoEEiIESadxvuL6BTIzlgpEgjHGav0B5ctVsOb5e41ZDGnXr8KcABIR1vSmkhZWPpi7VE/5iHpOKhYiJJcXF4CJyJPvKS4zFouM7v8nVDEa4qK6j9BToBSXLZUyyJZHS7W8DjgRvrJtkN7W9lBfMPPtIjB0horDDczFG2HqEJlwSgnC7+MbxhxNPuhzxnQ8VTWQTUbKaDhbH2tDgP+8hTBXCx2G52gquOUxMwyT04IKPgvWnEr</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YfsCVQmH3PxjKSFVAXSasalzWm2HUyYlDN5jVi/IjF0DGY9iJSrF1zUbk+A770odSGCw7VPcG5Pp7TpdN6qYFBKJOJS11HF4nZ6CnCLa9D3IiN7wE4DrRp3mYDWkdnycBjF0z/iV9L0pwbaxRjBT3zh6svHSbHxbYvJBbRlPmMRbuA5b5Rwyn0PCmKPlZIo35QPzs8YktY3ceg49+bKda6HlzrYo253Dci9ZysvtE0dOd8sPGmehMdPYt9N2YlerGzXTnSl1MUwm/HWcX6DrWsolviXkhUKRp2f/Y+LkAJSvOf6CUEKf3SAaiTGiWhJtmECQsDcAqMjOxpeoQLwJJ9JIhAkeiCsJkJuOLRtcFrprGpKi2m2jbTOIB+aXuBehlb4eYHYSNXSvPlcWCusJM+32aHZPAQuRjKyZ02V6QHbTmTexjnhnHGyYHJJ3gxdPWQgT2Ts8SN9Rj5DGSH05WF8cQ2BPyK1S/OFb2NzAXb6m6RvqRB9R6yIPwHXSUvjrc0kCV/KHqUCFc5Pgl54irM6dnJ0qfBS+D7HURNlJLma/rBO6CtZU3wa3cUpJ0ymnpOgdW7CaLXsONBcVly86UwKRYXNodcxF/hJm4ksAr13xwBDLzQbG5ZcuPtpNxJPV2Ev2MCaakLOncfomph5H9XBSiyZ8guZx/kT0xbJa+WHPBj1dxvlVwxixAZ0+wMIPDiFZF1yL96DiBFHS66atYrf+FDS0OkRoj8loJLi9egTEfuCx7GD+pNbyf605DVxrFm6r0uNs5xkYhvtK221VKOiHc+xc8RA7i7BfrdqT4nCH6oIJY4Se2QE8FehW6/mNfQcHLpKCSehXtjGVtvu+A51TMAFCi6zFrGOCdcbR6IkVaaGP5IRlvFTIrUtHDsLTez+OtqpqwAKmwj3jRdxRFCt1NrUK3BAqlBaTjY5WOzQUwTBHVTDbpuOFVIFzIahWvF72Q368dBUHvdJf946lmqJJcavcke5fedQtkdBdKiyerk6qQzuWubYr/9b7nsLymFNTnj3rnqv/ZVKNIlaeZ2qCewCGewDzE8aMWrLyHirY8CLYWuz1dfes5Q4bDRresx4I9o40Ib3HPmqinBSwL86IS8tfcxH5PHSYhDRT2vJT/nR0EvxECNZmYKtjU2/htEIWzHzMlv0P0GceTGXISt1gZCl4aSK0Gc1WWZ+1E83Sg==</encrypted>]]>
    </text>
  </script>
</dir>