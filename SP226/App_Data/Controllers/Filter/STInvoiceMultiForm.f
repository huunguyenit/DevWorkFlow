<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "STInvoiceMultiForm">
  <!ENTITY ParentController "STTran">
  <!ENTITY GridController "STInvoiceMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c81$000000">
  <!ENTITY FlowMultiDetailTable "d81$000000">

  <!ENTITY OtherCopyField "he_so, nhieu_dvt, lo_yn, vi_tri_yn, stt_rec_dh, stt_rec0dh, stt_rec_px, stt_rec0px &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn bán hàng" e="Select Sales Invoice"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYup54iCOm9F0ZUkgisCTRHY85Y3x1t8omsUGjRtjUF157w62Cmew1liJHscNP4+lXA3uGEsOOZ8/8Ur4Rf3htRZT3tudh6+3X1eMlkU1Qcv4EFeY+WWxq8heBDTIyx/eWaXXW5V8ZMB+ft5i6Wua4eA/huxKZlzepgn0ehFY2q4ijYEFZ8f739qMepXK/+7hxgbQcmHdYFA/+gzoyNdGjHbJlT4Q7bUat4OksLBxb1mFGhsi4Z3X7wjKS0QLHXkVKY8bMQCdK2MKHcRVTTdw9Pj50Mv9gAgq1AUHrPvjYQeQf/BczOYfoAiQoSMP9om3siwVoScwzUk2T9Obz75DWhzuDeB9V0HZhq7RKsvkxXVkp2GFoJSR4T68QzvmrVb4HctSWOKgGz4LWpPMKHzejBHpQDg5V8uUtu7yIz8hhr2DzBCYZJVlI2iWt4whphNs+DYbCKI72epnRmZWWN/Lx2EECpb7jm1iwitZ6zZrGmw/YotyY3zaAdI+Ca+lFVfiIhB0rR/+g0Ag2YaNqVktFReBbMKTqAk2ltzhZ7NJgy/ye+2R8w62iyiTWbknZdaqh0GL3r/Y+p3x3chjjfI/Li+kWO1CRIPPlMBi6yWfkfO2dAfiUqG2ySszpiLeIE27Gw8S2Lm872j9RBQ1tbR8VlC6tI2C5MQkIrszNCkHSviZkF1CC4twFIenUzccb1mTI5+VZeA+wznEKVu9boJouRqZDIOHF7yjQCzFhVQXZA/xnSeytfF+/wOMJcCB38dAMW6aKXM/EPw5HutBP4gziELY0PZtUGBqu4H4tNpW3JGlxs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxEXra3yWa40q3dxg/LeNJmh1sc0Bkz7nadHV12Xb7oZYxLNQVFtEv8VzUsk07bvnpNTLQwCxCb/Z84gSwWQ4Mp2lUqJw5Fuu4MlyOFKn8QpdXSsid0kkQHjLsGHIy36G9kYkBm+9iH1h5lOJ1lzV4AwkelIUvo/2tUgc4B4v6PeeFxNkJM2/bio7ghLNbV08FETG0Paq3n39xkoLBgMnsef/UFFleZM0KJZvqC72gzjxjj/cFiIvJMXU3khizB+qjCQFHU7pdV5uYkEss7D44F+MqvMZJtpm01gWXSnJiltzNLwfVkx3ALbE9ZOz3ix86YJCtuMovR8D8OhZepyc9OpkQImSTJk1HqkZzXg+Z1GpJd2Ll+67d5eWhM+mmo0bKdf8uREiGzSj1fv7L8FcxghBmZRGrLDtOZwwT3tiQEAJQ3NL1G/dItMbcv8nKJc+4=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6KvhBluXlFk8M1+cmNhpnZ7lVpxGRS84mJsSvdUi7jdwUrj7px5vvW5bPI1DaiBV5Hmh3gHNRUkH1uFqLieG65IKv2jNzsw3qB1RPlxWNy9U+Hf4E3pboyw9iLNmmECJnE3PJcEALACGPhSMipGk3mioIWd7OnMB5PIa/5c4XC6McUIeCYqaTJK0IwyPmoRirzFeKgCaFskW+9MLgD/pcAjzrv7Hg7HqDZMJbAinZ+yFWXPa2rYHQoYVhCwfbowBkHF6w8bErsLtoXncKSRmdAq+AZef8AMTC7WuA4LzpqHCEN7I2y7Up0fu7qNaS8o/FLVB2Q3zlVyRVgtPcItUz0d0u8aUR1Cw/WWVKMfa+J80a5jExVCG9uCbKsk//TwA6AxDRsH/1qQDDm/V2CCD4BXDXpkcwfaKoKURo/b2+YERGi0OL42GG2yPIOIFrXpFjPIe3pUC8YPeUF3sess0ChSnqvbnxf1B6DyH1LwyXiJsmVu6Ms5EnbrQTzDOca+8NBDwzbTDnNnVDQERXbEOjD0bluT/J17tMmpzf4c2G/iu1Dk6p7we6bAyDYHFeAXsIagQHSbQWKB4P5JJdy+Qi/HMANayFc5yyy5P9NO29aFJOVDp9774NEYHFyUu2myjJmaYp7wu9hhdSFEPDdWen7CHfcVYgW/TqGbVdMaDRQrv0BJuISO1LVfihn6T0vbBRquiNeePqlUYnOP6uPmXCBl2IVULv1ixcrcfURWVkDsMw7K9OezlMlUPe5gV3I6CSJRBMbubq8KLtg5r0NjdKOeEedLMKHMsiFqLvbVdeVax</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1RyD7txBWX5CJQkA1vnzVXKEYZgvTf0q+XhrVUhCJkEYrPm/MfHVKC95vkKSldCD9Cd07U+JryhcVsM0kzmsh2Iywfi4LyZlarP0NvJIwGqQZBnkMRu+HnnekNoOgh0+zZYm2K++5HiVhHApsr823kU8f5PkIVJKsWHK2fOigs1o=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLscCWbRcZdE1iJmWgnEI5WNFQJuYL51bNRmT1AhY1go82wFxHA1OYSesxFvlbJ7CnGwBvAAISHwjIBbzjZ1OSPsDTah+UaSd0DOXlOU/mLVDIFpZVWW2A7zpbfPY9lKrbKLOZ737IvCDX5Z3tTHQHqUP9sROxzi2Xn5WU/6bM5O18GBCr7cAkMrHoA42QHU1NS2+8JlOuLkm8V6CRlycrJvh7iJtqNMmPd4GxDTAvSesMC99J3aMJmPAcB1bhqBBxHXgSdv2lNuWwaDoIUfGaXOtwQe/9/3gVeejsD2QIbztaiPZrWca8fUD1TQ8w+21ii+sX+770WX0KJ0jmuXC131eHauklWIbcIdUQyB3klXwAx5nCbcf7wGEdsesh5JlCJVpmZrK3lWh95lMvenFPQV9rtoLdZ0gztjAoftFwj/nUp0W3cyCxmTD/gab0rdxHsTvg7FvNoA49kj9/zG5PHpzsY8AHvLnnjdgcOeXtsEeYnMLwX+Dtt+p8FD5mc4O9LsNcxrR4nqJlFyimltV6lY3R/EJ5jbJ/i6Z6jGDU5CcDeFdx0YpncY4EOr6h1FGw2pSSbAesQMSXNamqfqKX5NC1YW28y1p2I2qLX9jW8HoRCeBrEtfP0dp8dthzVmaytYcGnIlCkkiW7chPnnDDd/DHMfRc7cf7DiZaxxqg0V/YRFe1Sv1ME2qTrRnQIxg5m0iXeZNW69NFDpTdgYmYLNBU+gTfHtXbrhuJiURlfhh5ao2M9i27l92C4gdJBrmw==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2CXv3vMLpajZp9RsH56DUGa/k0XFjQq1ALZGxUpr48gy9Znaa+8/UKIgScvEUT8ToUVWpmyJ6lj2aubcIZECxVodRR6lDUy07RZa9djld2K0ggM5ri1Yt/7jqRf8NRKVhz3aN04B/f8gHuWfISLrc9ILRCoRoWcMRbEsdbjVmXtXglhF78ZE7sUka97c0R/wmWU2RqDSlps4yC8ifDm/KB5ZjizDe2Qq7laa94pm5bLuQL+kmShGyCQ2TLw4TXjTTzgGvbAZWNsW3IrF7MQAbLS++3eAJY1p/gVv1daLTpI/g==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>