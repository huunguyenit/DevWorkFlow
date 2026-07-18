<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "STIssueMultiForm">
  <!ENTITY ParentController "STTran">
  <!ENTITY GridController "STIssueMultiGrid">
  <!ENTITY Tag "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c66$000000">
  <!ENTITY FlowMultiDetailTable "d66$000000">

  <!ENTITY OtherCopyField "he_so, nhieu_dvt, lo_yn, vi_tri_yn, stt_rec_dh, stt_rec0dh, stt_rec_hd, stt_rec0hd &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất bán" e="Select Sales Issue"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYup54iCOm9F0ZUkgisCTRHY85Y3x1t8omsUGjRtjUF157w62Cmew1liJHscNP4+lXA3uGEsOOZ8/8Ur4Rf3htRZT3tudh6+3X1eMlkU1Qcv4EFeY+WWxq8heBDTIyx/eWaXXW5V8ZMB+ft5i6Wua4eA/huxKZlzepgn0ehFY2q4ijYEFZ8f739qMepXK/+7hxgbQcmHdYFA/+gzoyNdGjHbJlT4Q7bUat4OksLBxb1mFGhsi4Z3X7wjKS0QLHXkVKY8bMQCdK2MKHcRVTTdw9Pj50Mv9gAgq1AUHrPvjYQeQf/BczOYfoAiQoSMP9om3siwVoScwzUk2T9Obz75DWhzuDeB9V0HZhq7RKsvkxXVkp2GFoJSR4T68QzvmrVb4HctSWOKgGz4LWpPMKHzejBHpQDg5V8uUtu7yIz8hhr2DzBCYZJVlI2iWt4whphNs+DYbCKI72epnRmZWWN/Lx2EECpb7jm1iwitZ6zZrGmw/YotyY3zaAdI+Ca+lFVfiIhB0rR/+g0Ag2YaNqVktFReBbMKTqAk2ltzhZ7NJgy/ye+2R8w62iyiTWbknZdaqh0GL3r/Y+p3x3chjjfI/Li+kWO1CRIPPlMBi6yWfkfO2dAfiUqG2ySszpiLeIE27Gw8S2Lm872j9RBQ1tbR8VlC6tI2C5MQkIrszNCkHSviZkF1CC4twFIenUzccb1mTI5+VZeA+wznEKVu9boJouRqZDIOHF7yjQCzFhVQXZA/xnSeytfF+/wOMJcCB38dAMW6aKXM/EPw5HutBP4gziELY0PZtUGBqu4H4tNpW3JGlxs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxEXra3yWa40q3dxg/LeNJmh1sc0Bkz7nadHV12Xb7oZZHgEkA7r9LsyRTz0vYeigpMcgqbvQAk2mwrpIpN6CbGpDgJ5stMJ4sLkpS99lLwPssAYFYEGxPnPYAnhshOa4rtcBjjLkiP9NliLn58TpF0dnvaQrp5YaM/QNzulLNMx2N2Kc9SsKlNZMe+doCbqDpp23ysBwGcnD8u+Zc/ZV9gJxoLQNBkhqjhdHruZGKcJbQ/sQHPTBPqW3QI4X31ow8rMnk2U1F1ZKsF7Mrz71HaU2itkuFoP51BMhGgKR363pa6P4r7m4uBNZpU6+726g7miuWUzWcEEWImT2S/ERU2c7n1muYlOfq349U2r35koM410HK2bZHAXmc21gwJvCf+k84ukM0LpduD4M5rO0lE7vMCAB5fHcg3EL5cERk6QNgd+71QFK7KaG1Aatu3xLw=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6KvhBluXlFk8M1+cmNhpnZ7lVpxGRS84mJsSvdUi7jdwUrj7px5vvW5bPI1DaiBV5Hmh3gHNRUkH1uFqLieG65IKv2jNzsw3qB1RPlxWNy9U+Hf4E3pboyw9iLNmmECJnE3PJcEALACGPhSMipGk3mioIWd7OnMB5PIa/5c4XC6McUIeCYqaTJK0IwyPmoRirzFeKgCaFskW+9MLgD/pcAjzrv7Hg7HqDZMJbAinZ+yFWXPa2rYHQoYVhCwfbowBkHF6w8bErsLtoXncKSRmdAq+AZef8AMTC7WuA4LzpqHCEN7I2y7Up0fu7qNaS8o/FLVB2Q3zlVyRVgtPcItUz0d0u8aUR1Cw/WWVKMfa+J80a5jExVCG9uCbKsk//TwA6AxDRsH/1qQDDm/V2CCD4BXDXpkcwfaKoKURo/b2+YERGi0OL42GG2yPIOIFrXpFjPIe3pUC8YPeUF3sess0ChSnqvbnxf1B6DyH1LwyXiJsmVu6Ms5EnbrQTzDOca+8NBDwzbTDnNnVDQERXbEOjD0bluT/J17tMmpzf4c2G/iu1Dk6p7we6bAyDYHFeAXsIagQHSbQWKB4P5JJdy+Qi/HMANayFc5yyy5P9NO29aFJOVDp9774NEYHFyUu2myjJmaYp7wu9hhdSFEPDdWen7CHfcVYgW/TqGbVdMaDRQrvco9GsGzIb5C3JbwHCg/QoSc9YEA4dCF4Sf0DgcE/HeyhYCWouSBjnNuRV1cqdHWoKbdWAyrbB8XdWeVIPrIV1rwwWrTtgJtNUDeSzJksHs3H5yDzzrf9fs7vM/qzdMa7</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1RyD7txBWX5CJQkA1vnzVXKEYZgvTf0q+XhrVUhCJkEYrPm/MfHVKC95vkKSldCD9Cd07U+JryhcVsM0kzmsh2Iywfi4LyZlarP0NvJIwGqRPZvVVR8YDyudUbROaFfvLRs7YI/oUDUVT8KaFsoGRt5XUlZj5LcP0V8YmjnyuU/w=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLscCWbRcZdE1iJmWgnEI5UsZhC1ZcdjGKc7YuBpcl36pKc36xdhojm4wLNYa1rHbNusCNAzVJH2FeqHCgJaG60vaWZmHidnt1vGn3F0Lo8iZzWNwATgyJYPuezmwre13iFmiLK5O1LkiHRYuilWfb2ApepxUCwN05qrZhYmIpn/4KfIcyyvz/v5V6MhPQIjHz9i2ocpQrZtLCGEvuDttQeFVSetg6pNXva6nX5aYhAQNwfQv9a66wz6tgIyT7mBTELO2KSR5E9y8evrQl5KwgIvKnnsl8yMz/eL0gBjdeewSX6j2fbWZIVYETDLSpAnHjdKMn/peuOYIfV1ivOBWq0K8jkUmfKZYFt0nQJnhsdUdEsnbULg7IZUHJSKF5rWnCJhnei9Fy9B47Af424tbOZJw2GDZrmALxNUz8D2YxzijspfS8DEPqLyc8zIBcN8E7F4khVtnUL3YvbEYr0pWFHGVsoWLT+bh87/LlApZ1qZIP4cq3h1LlKyh8HMYk3W9Ek1Ja4yVREYC25X9283hyLb/YTz9R5dDi4Jzk0cxXv0a0M/F0oT5Z6QDj/0bl3tJmOD3yJqnpKtvq2ebOe07KW3XCbqGT7mjPf5DjTwgToVv62Rq9uO/xbS0oZ93//XR7vcwpIKLyOhLsu1gFEo5QA2H5TMoe2AaD9tjfglQh0Ubz2OHqNHMPzZlMwZEoTXAudIN4OmGnur2sEjS5c3TsJfaaThlAomIFNBG/EY6A+yfhIQo/rb2E1WSCxgTxjdnA==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2AFKMZK69s1cbGlzQ8gSvfAfkcifyZqEDq26oX0oEPCZRhvSH50twBMvNdfaKIy1OSiY3+tLl3jMixRUigNLD/2kf8yTb4KCsHn4fuPm10pbTKmF1DEHiwPpeGmWahYYAADj17iRMzhk+yJWiOW1PrVlMTNA7NCjOA6AfEYnm0ZoeXzEQQYI0pxLGQRyUzvmvsP4+BYrlhez6vHhCimCFyNv01/YO8mYINvWy0serXlNsvDBsVUXjy1lVZV8qyCEuridbJG+D/oqXuCqfFOgcQrzcduQVVqrw8e7HYs2Ly/uA==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>