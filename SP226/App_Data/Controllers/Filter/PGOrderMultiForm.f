<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PGOrderMultiForm">
  <!ENTITY ParentController "PGTran">
  <!ENTITY GridController "PGOrderMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c94$000000">
  <!ENTITY FlowMultiDetailTable "d94$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_vt &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn đơn hàng" e="Select Order"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFxAZzBvBabs+abMCmRAI068W610v6/bpKU9+17nW7OJqk4JzGc9l8Y0gbjAJyQb8yy1tpMgfPQXqKmw6R0ViHT+CfQTO5m+KgvKoIJJnSuyUk39ATyglYuSYD1hLjmLJ/HG41mzm9JcN2pzaQEcavUeZAScmjYL5RwQKVizO4N4E3wZloNzVqZaKgW2x7rrLkEL1iDLIkODMBCC4ziXiy7d1SbMwdBI1Av8ktpAXvCGlBcNiFQafUK2RMNB4zmywug90ByLAEjAIaaJ98dC1EiWsFBFqnzkAaUTH8GbkIBKS3lU9qxFLJMneBqfQIEphjLd6uLk3EdcL+AkWzS2G28V</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLqVo4vCAGQr7BQBmj23Asgnxxdot2Gn2xK8FJrfdqfV9cp1k+VdNnutlRqcbxMMueRl1qmlKmaP1yGwkQT9PehN2AE6HbRyPtAfYrzH5aD3ftD12vWKkGM+4M4I4bWq8t1TzXCaB2CPpWSgMVwnAP4ujZPtj/ZksajrjmddtwUk4WMwzqv7h5gsbSGzdOYfXzQtSEEpc6LjfLCDsc83DWCG9xMY8BFEY8IB3VoNP6mu7loJZ9uOTwTWolekLdHwnoQjMKm9TNMz1Gsw2Riu2JfEQ8UP6Ki1KAwPp1lamty8IyR5DoA823of51tt1SOko4E0QM3+hToXqAS215/eTRrry6SMxnuNwulxpYI1McIA4Viqyfn5UuciLEXPmHNtMVPrapoPGcwtV/KmSK/yHE5zJzOwXczififsWTwT+hfopa++iC3gu5dyqlswLTWCBTexkBl4OGU2Qif99S2wSfi0U1vyzRuKnCQGhbKDlSnbStKHJVXVndulcWS6gtcF/Xx7eUvAvkzMGreYM/RSK/HWvgM6xcHmCVgKZPOgcOHCnnF7ldmvzLDXTwxNs08pusB1yqRacteD0Io8gBGLLXlzDVTUyoSsAgyUf1UoSeLV80yyt9g7eNAiQv40sJEgEIlJoDyPE4SDoktOvTR4Sa+0b7J22+q6Qd4m1sxEA/i3JQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xa8IWiBR5jJQ6f0MLq7SvdAIf+6JiDlfWweRE1iVnxOaeFvs6OHeCS7oV5EjOrIKXQ==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGs1wPlSR9Sq/nTnYyJ31Gkozq8fVirN6aTgovBBjhThrBAhP5Qtavls8ecW8RTQ3mHHNKAakqbInrSq6QPiJ5UWf4BfvYekPzgcM1xJvsYfJtYveBouhI5ns6rj40KaZwD53/dZP+OB3B3CvR9oTm3XAtGhFSZSjzQqcPqFhg+k5o/kqJAu/pWeu5Rczbtf4wIDAuUdqpq4CxJn31PIYNlRXe9dwHro5dLM27ZtnuzMo2sKjBefzCQIUjCexaEt4tyfK9hAlguyyEyVF9OQq85XgfsLVUseLXryH01clGt98=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2C9FQYOyyNwTLR4EQL6ASor+dmBc5qo+Cxdssp7ZLpGzJmtV1ZPBKSg/VQuNbbsA+mtGGJa4Y5aAv5Er/Bcs/fPSpSf8CoyNEE7FyCjk/FlThKFtfFL6kGPD4NHR0Uk4wnmgbdwcCTW6aV8kwUL9gxnE9OZrPC9VzuDAy2bXQnbs+BIJcVK12/MRvW5zNf+DMIWhNL0zrsHQpZZiSuUw1O7/R+JpRUU/IGcc/FI/RhdloNQ8OvSDufcsqO0xjf74j63L+guQe7p3hr7KtgpM6J+O31i0kJ/iPDMkjke+ls2AizJD1RrXbuTb4kGd5ze5uo=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>