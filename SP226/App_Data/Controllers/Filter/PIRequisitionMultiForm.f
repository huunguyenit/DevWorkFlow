<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PIRequisitionMultiForm">
  <!ENTITY ParentController "PITran">
  <!ENTITY GridController "PIRequisitionMultiGrid">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY FlowMultiGeneralTable "c91$000000">

  <!ENTITY OtherCopyField " nhieu_dvt, he_so, gia, gia_nt&FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhu cầu" e="Requisition"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFW8jUoJ2OTsvpyATT048ZGQF0CFOx3B5w1SPMvwnS1LFcoRSLRmynMDD/JFQTYMbFY2LkvXYLqGgLzhAGOAbpvBNVLyNPjz8g1Guc04EsE1adNke8ejRMKnEy/fkPHM9EVVx60RH6mXQO6BsmGIA8A+4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxbvAFaleep87csSQUYgiZ5F2qFBpAhytNfH5Vwrme0m6DQ8E6kCu8r4frIWtyR7VLehKLLnfTJNI88j4GVziScYpqQGgwSbh7RbDtiHW+pCvWys7qtYEf4unoYqK3tx7LU7Rpg1Vh8plL1nj4Bh/ZDF11Fe11wjNanVq6up+DeJXViwWyxi/Cws6nt2Sl82ScWk82R/kQYpGNxolyuiFvbUIuoj3vcqoKHVAXcifzZeUUOXKauJ9nwDkQ95SAGU0xTEc/btjgv7UC5H8ALKtam0zQngMJQ4REe/Q6RSaxc/ivrX2SlSLtvnt8kEahOSkSWsOn8OOpnaSZznK0izsEs</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6PkaOmERlqkt3O8okNu9szCGa0PZyeLTbAv8uiV527ApFIIrJlRA2UULCO/wp/7gi8mnDAC3WUETD0Jo+y+/fWuc+rq+4wpxjKmsBAth84oyK173fjQtPerkB0Gg+4EB+pkEFXaVAEWdwxlIve+urYDUSvkr6NsvU8xb9MTlVIHdwZqufqop1yKowO4he/1Y7h1MJwgXO2vqaNzc0ktSaZDfs+u0pxtFs/eysb6mSSDlxinY4pD0k1SWXdInHHkUuUA+xA1DF99ihEExpjl4LY/lRvvIOch9fzSkYY6KoaC6Lqm//uL6LFCwGnRnSN2OI7O5ZC2s8ym8AL+Z+L8gwGCi6MahaD+VnbLDG5tIjZ/LV+V+LqZdO+qmRvNKdXFxyNip0Lsmzf+BgDDVCjN9e/ZeyZH9k2GDWlGX7jU5dA0inDBKQdIdzheaaCdZ6VBJBjvFc9dA+DNGX1TSFdHJDj3L+ZksYgWfBDSb2aMLLO9E1qKStVkh3QWp6qJCZHgE+MGGIzh4IVAwN6TJXflsHbdpJwb8yKXrgKr3Qx5crm7556GEERMMFO0cb68lFpP+Cz+YR/Mbiwm6A1qsqhE1JNk7mzOwmPrhilfGSIriflE4gzPPNqPJtiABSLe8H56P6ElNCvRqG/GCfki4k3tcco9NITJ/BwkmghrDGmMj3irh</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYdznY83fmWD9mmSvnT/qrJhIHht8w8oHuhOlYjass/rKWpDn2QKB3RJgyUyLAQH04kpP93l3mkarT2RFF+L26pA==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGs6a65jbff2DHh55JXYdHiqbMdeZ8RXg99LWFL9G59vGaCoF5PWfaVEAOgDsI9x7dklFN5JWIEXV9dqCq5J+UZTBk1TwRYSZ2xPOxF+Ghm6mkA8NOXhXIXku2+oDubV9E3KtjTfbRsIK/EA6JiYWKdseTAtw42u20B6VUjqvzD2w=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2BLDmj/uFiwGlS5jPZpgjYlHsQ2NVtg67KlZ0mSn84KP1mkVIkLtFnNaVFr8AM7pli/f1JfQOUQFfKRgQSxd1IwSIimW8L8Hwc2G2YsBDDOXmnI6xFPDSFWNj523LOEL2//q0mYUqZb3piwjkkVZWrdw3MTBeYy+c8ZgdaQ7l4gSlfkOdJSK2ZLO8h58GGD1x9VA6hUX4HY4cj9mP4MCcJiZIFn0VT28n8BvRx/eYcjpP2o/j2ZowKS6u7ZTi7eH++9kHPhMdm17f7pZS/YyROW</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>