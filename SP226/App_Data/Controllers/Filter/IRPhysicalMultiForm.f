<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "IRPhysicalMultiForm">
  <!ENTITY ParentController "IRTran">
  <!ENTITY GridController "IRPhysicalMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c34$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_vt, tk_du, ma_nx &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập kho thực tế" e="Physical Receipt"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFyTt67FtPd8SO6rQW8Mbn7RsSIBZ/AVL+T53dCSHTrEF5CM7Ww1XuKWHp1Wmn3AMrPzfdspBTiM7LXA4pzUaeJQl/rvbnC1dvm+0gxrmFp+1HFd7G0M5+LeCFG9inbDwkN6zpJGYBYmZPtJ2NsqngsVIfxGlXOA8c3RN21zUssiBP+cHuDQpj3tXC6bWIjiKcOl3qdjNpt7DQu8b8qV2xt3SdnuceWL+Mt+ty/Xlewqq2yhqSXQdkqk54cWKYGh3n8Tbr5Gipl1X0c+GSbtiFDpzPxvCCqXmy1/GEsGcjMuJDhlSFJMS+9tTvIyL3yRShOWhFm3NSI9z/cd0/kLzL14AZE9+CoLyoDoTPEzvzHCVA==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLqVo4vCAGQr7BQBmj23Asgnxxdot2Gn2xK8FJrfdqfV9cp1k+VdNnutlRqcbxMMueRl1qmlKmaP1yGwkQT9PehN2AE6HbRyPtAfYrzH5aD3ftD12vWKkGM+4M4I4bWq8t1TzXCaB2CPpWSgMVwnAP4uw2mffph+mn8ObZA4+OX7fEufCy8CXYOI/DaleVeNA4/QVRgnob3guXz+5tJHpPuneVZR2yh2csx3EeY44qCkxu4JLNNKuWXul4UV9IAIlc/NxTcLwO2IjhtBYWHFoNnNmgiG44ObSnL4KNF2K5XdJjuceK5Y30uVkB2jgkCTm/vLOIGKAEjg22NQY10I2v5l+Z8Jo14MwNf+Bukx+60Lsm1GGbQ0NSvO3u12CgLpxCPEviimEalSM7gpc4QLMSe19rXGPMIWNVqDtlp2bIxQsEemvwWjcGDrWT54h6Ia7fXleLRw6V+Fo54KCjeWhhR62wJgoEiDPzE58MtdRpiEpa6MoGQehED0qS75uszgfQDxPGwYjS6OwGC/ze+V56+OVE3AggHRn643MLW0Y0j+selwNGWs9Qapa/RnVpXWmihgxZLDlEBA/JTIsYxjAcHi+D1U6GuWnkElEC0eYOSl+HJ02FlJrGpPvxmLRGoODtqOJhTOrxRaIYnkMhm3FgWe</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xa8IWiBR5jJQ6f0MLq7SvdD2eygM8ZtKOd8UxQx+HtFtpw83gvU8fsUgz3fvhv2PXcXRAWqN+hETwOFiJ3PyeWxm4nV2l8Y1mN7vaZMHuOyD</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGZpTfmWM/q80M4hhfm6i8gIj1qx0wg0pkEfDKKBYTHsUgHfbZnpBU+WJWIPZFhIRtMcDxUcj71/0B3d9NzHX0efmz4Mw4N/KZqgelTJ2XLbvmodXyZ3XWoRUltGj8nzfCo0SLE8/xELgYA09IO8xTvVzXk79B0keF10rxEN43NuLnxgC17JcYQfWa0iKu3UCHU3JV8CrrvdfGi27e5+VF/KjfhBim0d7QsLisXIEumzTo5jNhNcfZ4Bz07tWdPSXcWEKa2ZFF8mp7kE9HsbqaeJImcTUyYj7r9S3FCp9ZHsR+pjklhdhXUXQAwPm+uPBtapOQn7I6CL7OuPDkNgKJIw==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2CRIFP6dpukwLRFmWG32A9yEQwDVCk5A1VWwD3EUCNn7oZSUccx54N4nxuMS0+qy9/cRo1PBweDDjNr44XYZNHVhmpl8tFnGkp6wcbLN9MlZK+AWYJ5tTR3vVIZS8yv6lHl6+rRRqEqAY10XkTZWbP8yngfDYO5rnBpU1YdghSwy1gKvBSRNSm9QMOqTue3GGKkOXdb3OUyCRXfNG6bfOOzqQE4l2ze7sacd2y3aQNo3me8CQJGSU8rkGt2if2rdvAsf7oS+2TJIz9amXCEJagR</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XSZvjMoto7NZDvS9XWsfFiWYQVAuzdPmjnHwtPeSIFGWsntGG7p3Eaqai5OzJG8W5scXNGBQW6b4jI8BNjQS+6LWll2R2+a30QNO2TLmK7rsIj+w8FvHeRKDXiZDlMnA1Vgk4p3Uc7zl41W6/WMB7EY+gq7R1XqhR13wWp0lOXK6jKbxv6mk8XkaH/3noqKip/5TAx7WrKczFLmhe3CwlwtJmCpIjpGWLpIX1bY1Wjh</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>