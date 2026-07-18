<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PGReceiptMultiForm">
  <!ENTITY ParentController "PGTran">
  <!ENTITY GridController "PGReceiptMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c96$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_vt, stt_rec_dh, stt_rec0dh, dh_so, dh_ln &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập mua hàng" e="Select Purchase Receipt"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFw/voS9KZylgJtC26YG33NZA+mZUyJfAwQAv+VYFHaTlfYmVsL7kR1dgCEjPYnUh8obh5fdCChJyR5SS4lWIZu1Bpj9Pa/gzdyHVVlHRNHWpuJVNpKEepqcsKjfSe4mg5+2uAGTVYtga+ms3gpZ6jtVU0u+es4HWTsZpiGy7xonhBaF9FsNGC+YzaOUHTuz6InEqhtbwot44S1pQJEmEq09kvFsmBhOwrbpzgbcHUHY1IYz1ftcXdW8HfCxAP9HndIP5bRVDGF1kCHt5iWTpeDHRnIL3UeKPzcATGTh3VEohwP5RyYjmAkzFYIJ8IiUk7U=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLohCMBuKhzHFSFBoVfopCc4jdTTzMAQqYnf9Kxt6cSt/6CrYj5zJAZ6AmH5htYKPKcHmituHhP7CQzi4xY0Iab+62OLQXoEx/wqgsV/cALsRHWVuNaxBHMcvE15Oq0/0qVJTIpeVq/XHzJyl81fHeso/m539CMqzr5fmojhm7neqnhMThyJik6ByDTdiK50xEbU7Ui8DKbwsXckp+mB7PqAA9X7cxmRL9h9slmyPrRqtJUAr5KFEIs91i97vDrqTLUsanS6B/hkWantgxNrbwR8DBaXSYSpk6R98+SIAn7pl2wCxKuMj7Sj142D5+4zS6SsxmmoHM/VtikJtCEC9WnGFZCsHfL1R2FHlqBLFBvp8yDrVULDUsRF41PxusnY+cJn5nmFI1swP8sk37auA8/Z9mJK4zO1r7Kp/hRL4PTGKwLV8kFpQY/AWuSbaXQoY+10KmZH80xTGOGOkdzpKBokP0qgsRlKflo9lJRVVZ47aTxcIcelHOKCMo+JIMJZPqGtRh9AfGd0EdDUw3SSNCXFBps0TsfgztfePM9uXVtZ5AskFbOJ7bsrlaFcf4727EVlQR29yNP2tpcBQH/l7i5yHBqvmgmdVHqq2VsnPR6En99KO92DY+cSW6GZ7f/Jz7/jvujdeFb1mkNizyenFkkL4wrnZcRWcYtzUR0BXpK7SgreZ/bVFnjW4nT3+F+TEpSpqjoia2oWw69178QC0c8t</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xTe1xPN/VnWbCbVkJ69OXinwelVMFzgoGo8IbDNp+Px49/k03U40lz/xUC32Rqn+P59EMdvCo1meQFPruZ/3vCmWo+y3GSJ3kvq36nLSRBDX</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGbYym7LotBXvB25tWYXrAqVbq4a6GJsdx4J+b8IiKZvE07jRsUO1MIsiyBtiXSqlk/a6y2D7db62aP+1oT2+J8NvoRVlTWbfOfVWvk7jaY6cJx/wu/3tMeE4cTgWR+oeSleUlqnjyB3RdiemgqwX9ZrExpZwC+V1BuGG1ahsbk5ogAljqrtOQzPk+CBvk7l5ppAEFktH0X4i0DsaxpZJz9EhkUHWsYUuoiDGizVJFc4lVG4mzXt/MRwygWdrwt73pRA/5WwlrtI6MvhnL1XPP1y6zKgJpXeusU8ztusZZnqxe4P9KboMfkSaSOaPqVxm/Yh1OOfihTTpvALCeHYzkrw==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2D/LLibhLyXv/Jn2KC/jiPwS2hinTZbze7M2s/e4qjvqgdemRtz8wPj9Z5ktoUh++fe3KN8U2WdBc4Q/+Vd1lyG/4JWKLqtd/JoCXzvkSlXCcXftGYfb3ZmSelKVRpK4sBxTYFPcXP5jSMjG2+k2r5z9p0+rsYpbAcg68JVV18V9J7sUe9Y6kSzIfRSK4piZad8zxNOcxmxaP+iyK4dqwakQcc/ai7DezC+NcdKp3KOMe2AQHJOntJXDYgX7CmmSGab4hU9FwfgOemvFVuoHHJi+t8TASEQnM4DlGz/9AuP0L774g+yUrRxZzbBTPHzXOHrwX7/5klx9NnZ1szN9QRsiV4ZGN7k+AcdB3x0W9IVL04nNnZGG0QC6DGi+DnTkOOhjf6SKj/6fXLwNcltP+L7</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>