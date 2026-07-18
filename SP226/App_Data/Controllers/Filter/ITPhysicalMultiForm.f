<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "ITPhysicalMultiForm">
  <!ENTITY ParentController "ITTran">
  <!ENTITY GridController "ITPhysicalMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c65$000000">
  <!ENTITY FlowMultiDetailTable "d65$000000">

  <!ENTITY OtherCopyField "ma_kho,ma_vi_tri,ma_vi_trin,ma_lo,tk_vt,ma_nx,tk_du,nhieu_dvt,he_so,ton13,sua_tk_vt,gia_ton,lo_yn,vi_tri_yn&FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất điều chuyển thực tế" e="Select Physical Stock Transfer"></title>
  <fields>
    &FlowMultiFormField;
  </fields>

  <views>
    &FlowMultiFormView;
  </views>

  <commands>
    &FlowMultiFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK4ctH4b/XP6ctWHaeLJPsSPfWhGInMoQv79AAZZnrFAVngu29mcqnb/8/mglidvO8EcmmyRnGUgnYQvMLnRj5CpIsp+SFwzlPO3v++bv9fjGxXwPBM7d1GKL9hfSgrhMpfXx6Kp90tNSkqD5r1cubEipLWchQaRPUdP9wZ9cPF4ym0O+nrHtEJoycrfVcyNOh</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinPV2HzATQPLaiz80Gy4BL7dAq2oNcBcoB9kRn/Yc5yxHK6/JuizJmgBqE3hnRlBWgoCI/1Zj9ZnrTUOcwxWcDjTX15KuRJE1rntQVDx292mxFotFaLXXwerYqT1rl2lS305FbeA9YSRI8JFnedIouUl9D5B5/PIVQikl8P7VvHE1xm0eaeMNu26m81j2ZKgGaTwotztunJSRNS6rz98B82CNyCVwU6tQVzlZb0V517W4mRcmteVm8QlaIgGQwig+7+kyepA5mnmwsDQf2Vh1xFHcvOQFfxPG0PxNnKIQ9g++cv4sDrCHX7TDmADDQd688+KneNgbS0QXKxtJOzW9HZFSY31fR5ANzU+UUXMqCOJdQ6SqVpJgDwSa9lKyX69dNL2qvHzhjMCyUBRkSOxL3qsqSpuxSJBhwfzRiUv9DRtRRlDG+kF2v4ITQYvdRgAgYw8QKTw7VpltYe+uVEsw3+jxe2ui5Wthq8VOzQRWP03g==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6FmAMVrLHk5yr5UPkCQ+Ji1b+qzwfShReCRa7jN53OuwY2jHSB5tCz3X80MnoEsd9wfD1A5XFcMQWwRzqglpc/DBqooysZXOiaHM0YYLN0TnR19SfWZ+Jxx4Sb4lPk1EoxrVUabVcVVj54N6nKgQ+4qFCs9maFG4u8uGY3arPj/aCIPiCnif+qCrnthdGATFLIIzbktUt1B1dPfSDGWW+TA2cPQqgChZSOjv6B0NeJvyOH4feCkclNgpktfRfgHXwis+yKlO35j/VjkRzHryKfv/zadRuo77gW6S3fprupRG56bHkZX6P3y0lqRce7EfQwXx72n6aV1mMe7mCudh8ygWeQCrb7L64wMrnsrD6pMBj9iL1yA2rcNA0XN3FEWM3RbSpUlrqOg3GQFbHksurV1re+fXQB05kKgZH9VlsyWTsmLxN4xr/EobRNDHK1S+HYAnCIHCWl6n/ptFnlMBGSM1DcJBHGVPFP6Bcuu997GAVgfY7bLmxlrk8XZMCX249WQHJrqYoqwdVbtUPFUaP2WZsskiW4Fdm+JnF3wITaf92yh28Arqo1NGhugHRHkGHPkgMEWsqMXsIl6SQ61ETNsOylR0KMhEnnFG/pzzprm+dUeF7lfC6UV2GdeAksdF4R8lGXudneWy8A2tiYPNJ0ANiLl2HAUISoKkyWmVmdeW40n1lH5aR29WdwBYIM+zLY2WKQi2TgvuAbDyUUYOaVrmfnyeOOGkp6AgpTQACggOSo69+MlwG5qReTy2gqkcRGhJ3icZEqiF8e5SmlTtPYRk/07485y1YV68GA4xkCQEReyJv4JkakabFOVoRlpe9NLhGVDKXG0bQ7TCOAqwAcPBxauQHdzHhIoMPZY0adPLOfYR+uEZxW4Rq3iXxG1Tce3BkzMydgq2GTCBiyHDpQLALph20aoN1ubRIBveJyLQowB23Bto8uVwSO0ZJgRiaKxqDQS41LEjlfIyLLp0PYokdYynaSmcgRZmuBoo1kVpzZyPigP19ggSdBO3Q/RFhyF8glxVZvG9haCIPSLSkYoOZnD7nKOy51NNNYDb9fKQW4QmGCYMCedaIdQ28F4RTYxPR31duOaZM11Fv0ldCF7S9UbsOpFqtKXkRnYjWITn</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1RyD7txBWX5CJQkA1vnzVXLO3ENowdYfh5kEjVJJ1If5EmnrKNpE+o3UdKHdKSrxWDShdGRzex00XoGT2M+uNuENQS1DPozVHjfPChcXiIHfg1dpDQ1YsOssEJrYCjIlh39KTqhz9r1ULngMQnuZLnlOaQJVDAbFDqICnhnLnYYeSCoIPfoxDcKxjIPqXwKe7WbsnENy/lO/Jqg2mVI7kHubOqabBP5q0bfxrKrUDIek=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLscCWbRcZdE1iJmWgnEI5UsZhC1ZcdjGKc7YuBpcl362JGbmNbl4xvIHuW254h13TgR5IU+Xd8O8FHrnv4P/XSWMzlFlRmOE58VRZaGCVVZBBuOdQqMQ9aRc0sMdka8LOODh9HlFm5yL8i28qHMAab/mz/JpDzmP4DR84r1JwVi4y5iPO9K03P5YTx+8kghO7FAeRAdugw7Up2ljEvxLjjvCCVBBgQuq85YWOXND47zCXF4ixchxcDT+FZW468nPqN83aa6maF6dy5YCrKcJwhY/55TAC9Nf9zOvAAEGGZp8nbET8cuqclzal0zooFOe4REiFBvsozs/q4z6DLHOeS/JIy2PJO/A2K0zXs6e0aL</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2C2sVKPdIOOLJV3NlXhfg7WeM17csi+4S7TIiVuXRUlCbsYU76E1S5GC7tX27RSRR2WCvkSoE/3mKK7DN1buegHmp80By9iWLIig6C5W+DUhrURvwaLU7YQsZI30tSjuZzIhE0oX1XmoqTMWcPkVxGH1y0Z+OnkpBmLe6CpNfet1U+3kMpfTedteK25uAjTPAwgyXZgzjnqOmiUv/W9bT/xJCzPHkVnwekVNnkUMA/1IDY15Wyqc7gZEYz1hHKvlf0=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3DGXHfkyQUuOQk79DyG3Rjx4EkDSbfvjQRj7GFsPC6R4tfwpVLYUXspr+S6gsVMfDJzSObgmVmZ+QUEQkKmk4FvoymKfZUllkcXYGDaNsBLpQma4x+JFSJ7hBqBNm4GVA==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>