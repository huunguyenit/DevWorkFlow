<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PAInvoiceMultiForm">
  <!ENTITY ParentController "PATran">
  <!ENTITY GridController "PAInvoiceMultiGrid">
  <!ENTITY Tag "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % FlowMultiDetailTax SYSTEM "..\Include\FlowMultiDetailTax.ent">
  %FlowMultiDetailTax;

  <!ENTITY FlowMultiGeneralTable "c71$000000">

  <!ENTITY OtherCopyField "ma_kho, ma_vi_tri, nhieu_dvt, he_so, ma_lo, lo_yn, tk_vt&FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn" e="Invoice"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFW8jUoJ2OTsvpyATT048ZGQF0CFOx3B5w1SPMvwnS1LFcoRSLRmynMDD/JFQTYMbFY2LkvXYLqGgLzhAGOAbpvBN11DcKK0zpOkyBJsW5aCI9SjTvqIXpGe7GPPI8+up8BK6tYJq4NQENH0xGglN4rg1WihykPwwme7eu0tc88xyS</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFxjDPSkh5W7G443vCi530xUsl2d/3gZLitrQ1igpzS01eLda6cDOwTySXyABFim8/nuk079CmN67EeG/0ROc51sViN21Ysxm8aynqH3uwdgr/ui5DRGs3z294g0Sy5Zrt32I1++GsYpBmMdbHjDQDlclRzo8lne1uXRTMLfcZXDz5BplNmnFMefnf+XrmjJr15HkvmVh4t1BcJCPTN/Ia29fdoof5Vw6kIxN93fQOMmIQRIjTs50891Gut5PAEtGfI4XbHjJrgMgwwfkSH516MV7EzFtvBv+P5kdWuxwKZRtfCA+ifQZgVPWplWn8po4dE+x83J771frArgGyK0cnu20G/FWZdyhpCIlWqCW+m+sw1oSHogQ4Aq8V2Fle5vbAc=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLoIqlET0JWhKiXLWUTA7Q6bybm417z/qUJuj4crbfH+QVjP/y3nnT8Rci2Jbwv8J1FeCwYGILSRS9EJilKBN3q4vAfbG3RVTOiyRd801WM807WpwNPI/kqtX0jdHm/A3Dpv8TZc2At6IWE4jv85qUPcDW7+fyuUUGKzVN21DFPyo4usSbq94LRwMzL/sh4et8mnrek6MhxpqBwZ1sUJqQrTDe6oQHEYncwVLZ9EDMihBktAtktvZivBo0MlQZpYFyalhojbZcFhTjo/mor+U6zGGZ0/wSRbGhHmv2fVXyPzjMZDI9PKpvHreEEkVLy6BTCW9rQSZ9MXXpLKT4CLEEN5jL9EH4QJ1e4Oy80FhW8Mfq+aSvZyIJ+/dad3CL+FoyCyvwOetdXSF94R8rKNLlCmMuwupSSVdT4KOQ2RM6sLKIEZIjR7P8vIv+UPvCfsb4dLhMkUt51QkyDIv7hywYzdY36URjjfOz6WdkzJcLXXCA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1nDdbv0+02Bk6vkfxajfl/nvNcCGX6CoYjts/tO8Tz1TCh/2rOOXBx+eCHobJPMygAREmFsM48MpAB5+rZ5qtQ7MSEUC1G9M2WoRkQFI4V1fRjZpMpikv9e8VLXI2uk5Osp+EiB+qhcp5x4spI04OpzNp9mrcWeSsiD2mTaqqbFU=</Encrypted>]]>&FlowMultiGeneralTable;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO1E6/mUPdKZEWCxBDxXWQNUCizqU3OwrmykmFL/NxJFft9/T82+1Sj0aEQPnPorRA00NSiUNmkgKpDDbKpzbhxm1OQdto45xk2dpzArSjbfza03bTbvBUb8wVcUowWWBpNmbqn8SD08fynE16jjDh5/ZzUJFyp9aGHziWKotgU1omnliu5gsY9UOtdqEYsPW854dvfG+bDEjCBdp6fIPbC+k6lxvLdXPUHT2uZNAfaw2gVJ8vBUZt7l2twgnOKSn765ueOfBlXHN5cXLpk7z9gKjn07XQcIFbqnSk1TdQFuvwvCHA0Uo1kuDjN2iKt3RoY6B2vt/ovAEwGpXtFWGBX/q6m1aNmMp5uVY0a8eQZ0IaSOp3jiQ0qb6pOwV79SN190w3Abu95QQqAR6gewv+wTjSIcHFcNw0tJZfpWFktUopwfymkPR0eOimWWSQSTxJSEB9ezzUTqAJ5THMx0sDcQydVMOGfzuXNLK2mNWgPQJbYDDl0aFBwieDo933jtDLGKS2UEmS2sL6QtjBkIfNfujJ60bgWsC73OEXPj789QNfXUdx2O15cZfXpY4rbur21pnWVIX7ltHa1yz6kfmLQORJS9XDgfpZTpVf/3t2V1L5PKt7LdKDZOQjOWk1z2hZPYGaMP6Dju8Xlafa4CeDlGNkgieTxS8sVLXLA68GTA</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bsofxkvjUqOlW2vcLZ184coMFODrWjDTOnjzxyEijRtJ9Grf8bHgSUrKlgvHg7ZASzXK8YA2mYlmGIHGQEQ7zDZOeNxTg1Q9PXtoL+u+1M5m6uIw3LuIeR4roOdh8fZgu28v8DSEf5Vcx9FXeVoAym+JCVBGpnRscsSG0ff7ejlEHZihQLgNQsXq0at4VjIqIWEuHpWNB+QQBulMnhF6qviYzVLN0bVibjsBWUOc4JoeTg+FyHYugkfqD7wXCHlTUuCqtICsp8a78uM6SSFRZcl8k1rfxNWcvpvLS5xEDa9eaVb5yI9+FcinJLnQPpeq1HbSbYuUlLTHfqIQXBWBY8IxVTLrtuSa4ACBLryqy7zQm7cG6YtTr/DngOhSj1d52hDEQ02rbeYQAgt5ca5RZJhLHR0Wwc1v86eXKXSsXz4OOeecnMzkVe65jfVp0qRfA==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2B6nUFah/hY3lIfjOYlpDtN6OY3DkvEk/Ob7P1eu8ttJVBesAl6CkwB2Kbr7yzr7pTpOnmlNpHtwd9jDhpGN5w8t4zXo/tG0P8dqBryyc8SWaeCDVExjLyjSVXSvUFBS1uZ42IUT660UoHh6nANE+q4daoENUoad+hN4LaOMu2uuzdPT+X2VRWL00DJltu9CiTsr28IufXahcJPBnlbKd4342dyJNkIL9GpP9ahp91kTGrSciLOdIYECGTJiZ7CplQGzVILOOmzreZMiMqX6hEWTkVG+H7D0/VnO81ZCLm/Gil1vKXwxHfOQu2UalpJzf1KBimObmUAL6XBeburvRZ3V8R/v8XbBwNwqUXwrOEkU4gdO6W8NvABYzcwE2F9nNRnhJFaBuZdpx7J8M8TF9q8WhJO49XuIx+gnA+R62LZsw==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>