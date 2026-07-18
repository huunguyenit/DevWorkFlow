<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "VAInvoiceMultiForm">
  <!ENTITY ParentController "VATran">
  <!ENTITY GridController "VAInvoiceMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c21$000000">
  <!ENTITY FlowMultiDetailTable "d21$000000">

  <!ENTITY OtherCopyField "tl_ck, ck_nt, tk_ck, ma_thue, thue_suat, tk_thue, thue_nt, ma_kh2, tk_cn, dien_giai, ck, thue&FlowMultiUserDefinedFieldsCopy;">
]>

<dir table="m21$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Select Service Invoice"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BXvd8rc/406evJncGMTPQTsXrBsMujvvXdkk17/Xn0U17qco29dH8ij5BXlRtOZZ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvzruqTqSeLsRQhLFC5KUIeHR41EpNdHGFV6yctYti5EAfn2ldcE/eN/qNSDEPqFQqQ2lD7fHrxsFwPKh/qqUSTCu4cyrugs8cv/bDpQg3WnNn6mjYjOonNnXcyw3jnta9V5GfUqyEkb0oz++liCrO4hkNrVrPddxXvfNSfMoNOXrABPoyr1vUETy8zs7NzyXlvaUr6aVMZ0lDKsb197b9oKNsYYtpZwirUTqkVDYFP0gNvVO5L3y5PKc3lYbOVeEVOIl2FzOi9IeibidwsOTdmofw94tG24nb8vzcKJIpsivA==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&MzxeHb5tRnYfGTN8ZF5Bls7zFUDCQhR9kP2jPsQEEd+lFaKF5WfSBNl0q7ymbQEZjjnveN2m3OmivScGWiA6zFImhJeMWOSBooqgjqzy1ZBGZ3GLdlKeBPuz4NM+HbO0BkOJl4XLIkwNRkXJcBvQ648c/7svc2O1HNvG/viwH5NQRwtKFTWHNXkWtukNX8d/nD8TQuiGVAeL0B7cj7JYyqZj/7CxXNRZCPNeLAPncsgRkOSkrnQJs/DhYVZazyuU1B0FViSvm4daQQ2Uy636LmLLVMm4TJ5AKPWF7b8GM9kxkJYpurtDT0cRd0zVGZY+0OhvdYSQ80sVBvFGN5EITLucJr1zl1zm9pwmpriuYvCOO1a+qSQe+F39E1her7OUOZiRxDIJue/PjeZDJmC33/skf1x2JeIwsslDM/NWx5AaP/o3FFfE01WQs87AFpf8JoVCSsOTgIfIEgSdp/+ELA0Dvr4eXBkDtF6ESD1goINULMf/EYa3nAeGaUC8Gzv4xMZaKLqTJ9aKOvg3zw4F9Ah0Da1/jxGkIwbFZRvIRCASPhrU4CvC7CxlO90I67WVPZ2mq3Mn11NojTcVaWfAmHTd08FqpwFxzkZYhbbSaCeiwdNjLq8dVomK0UXKwDNSqki1Qk/rR4jNhs2IJ29O7+KkGBhu2TUUrNrcIoKQSkXtOROzX3FEqnxUbjmhIoSG5KW9TwDdoUSrezBNg/5XOTsWjnTVaQe2MLDBtmZZd4aAA5ykjAIXm3CEvfhnP+S3Cdi4XDXRIV5FhcMe5ZI87WvuJKSg3Xhnk17fva6uT12W/gqrVJCVWhtlVk4gw6///0J/x3i1oxIkgFHthjNPuqE0nOpazWcOG06bcElOUn88e5rrRgypVxWV9g9BJ1HEVvFhBDS2m/0DILhAD0qFlg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwHdy0bFcj6QWEBYr/bAX7LOIzvdFkYGVgwQePHZJMmaMKLBkKAUIiqqHqv8Qmksj4Z75+k/yxNxGw+2pO3WOMUYeP7plbTnpCIGAnXg/74UEBRSlGOhUUCHJgHx4ExIf9w==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFm5r6HkyZQkn4Ubqju6MsRyFLtKbdSSBfCbnE8EnuE5VULGNwWcz8NEvaJcz5OtxWqxJ8Mgzn3p9KNqBUHkCj7gagk8eB3QeQ2zZg2rSqrarsSvKJjyt2HDa7ExFVsthiv7dTe4KiwU/nIHGBciswPUokFlSpNWbTj8ZPZDmUw3Y636kGLUI5aMNaEjkzm0HMw1o9QLgzmdg08970cQKmSC+jwTKc4TS45uQh93vpUZBw==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2D+TZ0x4YlalTHCALzEcb1cGaWa1fvqBcla/hbmHGqd6GZnNpWwqi1KdS/ZjkY8fPtuBCOe7XXzoXsyBP8jMHsJPGvBgvjCQxmiwbgblPSL/ir3HqHnHwCbZMpvQT+ojr4jCZ0jqqxaruJhthaMcrSL7gvf8xhNpAXkrwQJA50/O1uuyI5wceWtJf08gpuAQseJyNhFGFu+g1ZkhkJcmr3Yf6lOwIsJvj9GNb42JWwLyWykw8thM49SdqaYb5VDAyCUwzIkNPTTaBvi/qdkYG7i</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>