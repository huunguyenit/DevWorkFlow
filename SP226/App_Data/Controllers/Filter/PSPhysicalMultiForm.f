<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PSPhysicalMultiForm">
  <!ENTITY ParentController "PSTran">
  <!ENTITY GridController "PSPhysicalMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c68$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ton13, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_vt &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất trả lại nhà cung cấp thực tế" e="Select Return Goods to Supplier"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFyTt67FtPd8SO6rQW8Mbn7RsSIBZ/AVL+T53dCSHTrEF5CM7Ww1XuKWHp1Wmn3AMrPzfdspBTiM7LXA4pzUaeJQKpUxTGmDZxhlNvJOd0dfXIAh55xt3GBM994dTkJhklRwJanH2aAiq1mYMPP3TbskvZCGqg4jf9OAZUdC8B2sVJ04KeQyiRnyXPM1sAcYzPWswsdQuecu1HhDOCviwNMlDGM19kW+ntnW0AjvGYp1PMiJCrpierzUNVtnV/1Wo8sVMpDlEJJatlIH6xLgmQBIO6czE4zPo7laL8NQOFlcAu9FgyK12Dl4LZ4CTV0YPPPlitHKrEevdDFHEp/rt7GN</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLollH+seAigggBoCVUAWgvCN+1qRwjjKLhmmTRF/acgAEfCYrETZ1pa0AEWU3k5zBsj54z/GlprWukWXOS758En7oEn/2MWVOX8jAuyxBx72cl9yMNZgh9BU5Qw3ZxrIfQBY32XYCIGVbUZyifKk/sB4tpDpqAgckymZcksn3DXWoMmhHGx/S+fPTVSBWGnOreAbfUaqnbhTLRQ2LqeTAlYiefhTv7+evf9bvlsOlq/iNubhfmjHJ8x6EgQCtPP4E5+U9UCq/LZqKcQJFS9y0Jg9G8sNWy1uLJX92/kpaFw+oVSHQA+B61UQkl8sdkBhVZzCrEFRMipv08G1TmrPpM7MZozgOZxSh9oZJ3BL2jF5qiqb6j14unjMFh4vc7jB258eDArq1yb2Lv+jmnnA/JskC0h24i2Dx0dAKcxPrG7L6qtvXKVJdDSewSDFcX2M292eyUdBMSQC5cqFsPEq83Hf3JzyzVX2qtdFR9vnpzE2UtIYGxhvFkdBG/bODBUFYf6ARC7uGaJfl6IqeooZYesQ/KVJv74oVrMQw/6iQQk/nOyDZ6hw5SgW6XCHAHwok5IEVJbfT8RVsAeQvGzLzJf5z2B2dXCXqEUGtWSCWziY7pQ/znIk04lme8P4C6LnlesozFptPwqx6ReReZP57v+gOpKNmcUELeV4JuKTYGpywTgdRYUAJYMMag7y0+dqF7HKu0JBVmZS6Tj/mxvhiRFnzyPln3nHacFmeKVjE6n4qrExPuwU/XskXjAPQLVBAF8jw2RfguZwwkj9gYXxVmEV3TJjJgxf9OHhTq0BkYo4Lrah/8TLJnvGcBylKhcoN+KyU8QagvXCvA3FZLPtP5I3rATs4Co2zS8yTQwngtkFB7QOc89FyLPuLCDinPD3p+wy9SupzdkOBTxJVXtPOeVsTkaDDJSM35qHaTAIqV3Z+qxanUVYiPTYwUw+Htq91pX0bSPbLzTyIWtS8ZHAhCeY1GVlJh0cxBfQamn3cPzvNVsKhb8C6UtcAmaAPmgl260kzVC0N8qLpAdVVTUplUnhYNu9jis3iCV8L1mfff4aWkd175X1btDkbL++Rrz1WZnHc1KudOgn6ecujV5nlXTiZXoeHjMbOM3f09adFa3+R/EYEkVUjsvcMyp3pYgVZ3pJE0AUN+wFmI/Z4B6621a0aXX55E1qFPJCONJ9fDrNXavxsmingvn0i7886qQgNrCqVDAL3ja8hIU4ikpmtOARvvlIOXZDZd6WYJEUeho2hr4fwVJOKKjWxpXHBGhE2Q=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xa8IWiBR5jJQ6f0MLq7SvdD2eygM8ZtKOd8UxQx+HtFttPtpQ59XWHv4/O1ccvNV6tBMjLM2L6PTPZ+OOdnUhqyt7dXsgu71gVQbPn7dfE2zluysVLXHwGlJXFBChbuUYQ==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGTUUk7BpLDfkv0UCC2fDMcW6LHT6ZqHK1Rv3ycN+s+R+MzV7r3yoEds0RB6o2wrR2kGsckwCLjuBLaq0B98jbsGBfX6AMWmG7BiyrNVtnTnRln3d715gkNuVHoVQ/8qcXurpfr59ZiUFaYGcr+y9f6ofqfFyZknzNQi0gwhwKdCSfX3bhsc/zVbKbZmprHR47rWdHCHg9RwOCdKB9ST1GzFA31vS9l+DsgvSCYltIv+bDtdDJ+jZgXnrwykuagvPZgvdiDPosSpRWu+4J6bvFYRhzb264vM0BKghh5+WTu+whdY5qWObswBJPOoubUfkvZji+chhwUkqqLV16e/2ZKg==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2Dv5HXmrBboIukaquOU+mZz7fwOwHATW+5cIoy+glVVIkXtSrbXLhT2A9meg2QuEVE5SkE3Sh/Avu1vCXC9vYnLq1qiQ7tUAOATVXqVnTmYIpIHCnqSItpof4sMEi21pVTTEYli+rBuGFVZdCIZ7D2+poZiluMdvRLb+O3Z0Brb2fgUddolJZvbAdIFpWUqyFUJV4PoTD657wCQUoOTLo5Pu0z537pWguJNr0OW/DgmruEEoCK4VfScd/cSOeCZwjg=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8JQoPadc4xmj0KPgtk5CAeVtE1CBt3r5qq3lW4/aM24b6GpzgMadURHKCzvQ0dY50ZbaCFsx3zwLT7qqixdJhtd2L3yx4+Ovra8naqdLay+kGo5BjiN/ghKQXiYXGfHlTUUTrtDRK6MRc0Co+YLmqZiaIxn0udD3sqr7SlRF9wSYsC8Vp97OqDDUFyRKaGIlc5mOmVa9hEgm/VWGG0fYgPHE4M70fUgZam9aCYfGqPVlkMt4hDzH1PZ+W/d/1VpXH6wEYNM53Qvt4Y7L6qgpb4=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>