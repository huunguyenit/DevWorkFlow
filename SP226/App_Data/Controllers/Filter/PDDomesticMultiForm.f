<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PDDomesticMultiForm">
  <!ENTITY ParentController "PDTran">
  <!ENTITY GridController "PDDomesticMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c94$000000">
  <!ENTITY FlowMultiDetailTable "d94$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_lo, lo_yn &FlowMultiUserDefinedFieldsCopy;">
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pWoL1Stx89GsE/vRrnUIF8/fB+AFpg7iiWZD/pOpBZOP6HY98XjtR1IuyT50qfgFtte54q92Xr/i8H8Vk3+Hi6zEZbVteL70SFpDdG5eipgoZAp+xXeIVQRldSk8yVCBCtHwhCj4x62ZfT+mbupU/wYK4t1ik4JGyUaa9TlzfOk9wvfU0JME3AyDdNAnzaHIlZx40BvpbuGGV6+STOpleHjWUDDKBCXq5HiXogVHPGgo9LByDHmLW+2b14yGVryrynVr7VCR0FCZf2DSOU3pBG9D9a80gWMjbb0NFob+yKjfXQ5zC+mTqWMHg7y93WXIc5J+UklCX/nMuzLZ/5PCnjg=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbHTwY8vGihka3WVRS/+JgD9W0mFI8Fs1DA1jmdw7ApKi8e3uzr2KPmONFGEj/+uF+eiugyGlEKjWMiGNC4isUqxgw2WfHMf2CrpXgxq8mqrfL75vOk431LBt9uGSZeiXsJkv9qAIUlHzmVlZqhwrDHXcmbBWmltarESF/leO6zBtv4lW/JW1LN3MAt6aKvYG8ZI+yLf74rQOVnv6lVnSLFhftLkGKx9hBDnNSWNe8yctYuVp/8DagBwtRg6etRBDIapt6ig7m5z7u5B8AddX8NS8kZXtFi/CZQ08iuWoYGDakmFtc+WjTV/lunheysad8QZySUPD5/jEHn1Q62Jcn0Irlz2wqkuOake7bU7pcZhg3MZoQ9yKQ6vIAJPrni6t1yvKk9JRY+sWSNvsm5LYZQqZ/nT0Cm5Xr19bFoUG3QzeKXnyBtNJnOyxuWg7QtCL9dlxhE+vgem/rmxYqm98krXIdSthdAU6lL56+FXewpLPm+rtDhUmVazxtIXSuBT6yk3xQA5te40acZ8Saoeo5cPM2qvEPRDv6j+ihFXTgmSD/6TEuvWam00wNGIXkaZ7dkCjvgw32gFj4xlrtnMW6EkBBtpSrHUctBbWpSI6ejjj/BksPE3x5sNeQkxsV4gNNQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xa8IWiBR5jJQ6f0MLq7SvdD2eygM8ZtKOd8UxQx+HtFtah7seIxdhMbdyu+7fUSx/Ko0dmVBDfk1cogYQREZolA=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGs1wPlSR9Sq/nTnYyJ31Gkozq8fVirN6aTgovBBjhThrBAhP5Qtavls8ecW8RTQ3mHHNKAakqbInrSq6QPiJ5UWf4BfvYekPzgcM1xJvsYfJtYveBouhI5ns6rj40KaZwD53/dZP+OB3B3CvR9oTm3XAtGhFSZSjzQqcPqFhg+k5o/kqJAu/pWeu5Rczbtf4wIDAuUdqpq4CxJn31PIYNlRXe9dwHro5dLM27ZtnuzMo2sKjBefzCQIUjCexaEt4tgpDus0ZbTpFJwUPW64YNrpTpBxJUkhBRyHIj3UbUx0OaA6fR9uazqFvAcFdoBeBk</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2C9FQYOyyNwTLR4EQL6ASor+dmBc5qo+Cxdssp7ZLpGzJmtV1ZPBKSg/VQuNbbsA+mtGGJa4Y5aAv5Er/Bcs/fPSpSf8CoyNEE7FyCjk/FlThKFtfFL6kGPD4NHR0Uk4wnmgbdwcCTW6aV8kwUL9gxnE9OZrPC9VzuDAy2bXQnbs+BIJcVK12/MRvW5zNf+DMIWhNL0zrsHQpZZiSuUw1O7pDAaAcUeg3ZHYPc5C/SwCxIMkZgwjpX8LD6pPSGccqU=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XSZvjMoto7NZDvS9XWsfFjZtvphN+VIfeUKW1DZDtCKc9NKOM4tTOV6BJ971yQQc/nfHhsokJiqtEF6cH4DNXCzCRD7SGlW9SY5nSvZgFd7EkQnttVH/Bqe0BbLa86E1rdK+8AOZyp/PQ1xaPmw7uI=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>