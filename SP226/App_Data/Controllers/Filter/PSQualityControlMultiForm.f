<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PSQualityControlMultiForm">
  <!ENTITY ParentController "PSTran">
  <!ENTITY GridController "PSQualityControlMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c97$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ton13, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, ton13, lo_yn, tk_vt, stt_rec_ct, stt_rec0ct, stt_rec_pn, stt_rec0pn, pn_so, pn_ln &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu kiểm định chất lượng" e="Select QA Transaction"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pR8EPs+ZBmetvagdpHVCdUWSYwnD9WJTXzfHvMY1aEjg58aSIawEjLMVWb9Ed/7jaIQfoeyG+JhPudcJDa27slNC48PeIUPQWSINJ8CcI7QAuTo2Hey9ulc3wtU+zGWTjB/qeuj7IpsVbz0QqTFFmTQApumiJTWMvncM6p3MXXawE/9sJWESCCvKv96v0m8LRV3pOI4EKwbH2znJ+CjS4MJWbpg7bOEWXrESqd5Hj1TOdTLJuE08iU10NloTPzp1zHYGI7MlOkwX1+Gxq4e1SAihfQoamXal0FgoBlBUuxzUHef2kROJPQlew9xnuQAg6Dj3dYNF200bcXWqlCV9CoN0jWD5UwDfK2Ox5dvgmayP</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLrCo5nus0kUoikUaLZQJ5DXcfn/Ojt4yimQTCqNqym+IGC0KKdzYiyG9o9Q9LULYcGcdvcNOi91c74auyyGu3ZxQLxaVA0Cnqtd8jIdUlSkNnLQgHqcQEYa4Qc65xGYmiNstqUY3EXOW5CkFgC+eyQfsJtiqL1SxDwA6DpH/pydQs6yAfODs/Sb6cFqqBenYqk4IYEKx+irlRO++j9KjJntKtclCT0af6UXkFqVA9DaPDGyvT2TgGhJ+iv9pKK+RWRREe9LW1dERB+pFYuF8jrp2NGnQijyI9NEqmN/d+6Yyw33kXIfBVP8mSuRb+pRR6IwLDouSKIB3UkGEXjTvBBOyrTcHKdbhzxNNlZ1JgQNskcpOBoOTlVpKGrHMGIgZ+ya4658M4CokjmPk/Ao60T3d6wod+9GlEjUBzPrWWYDWHc/9ueHCtuAhCbW27GvdtyP4bGUSHcQ9OYleHwJKqBDbpSb0IF7aDPKqnO5XcQ7IlgY1NfjahFGvnhcWza4mzpv7YF9JaJXro1Kxo4HWdtCAekCnUSFpnLbm1zNT3TAtlgxmYVDkGCaSW2v9WzOr1+h6V2SBuZu1ib00740rxh/yrhYG4DUd28auiT14wlfwc8pwl44xjyYCKEy+rniVZKKJjjenvMXLDnZxIfmFPynO7Cng8+rHSsmZVRXpjnUkYZoVYkLYHPBWIMzwfcS0kENKnv54PuvEHgSaSoGHRX3Ev+YWJO9ApZNa31EH30kj15jXRsftT0X3+c196uixepi/uk1q0LGQg4G1ROSzbjfyc1ziAgFWaJtDMmcrR+MKcL+kMPoSIMBW9Tn1b7x7NJjTTfMwvcJeBjKqOZQCIZhyCCAKrTBNES5lHeOLYucVbTXMvXZZhjtbtPnLxZ9jYET8gz+oJWgo4lcNUwNXZ5WvVeuzsRPvUdWbLMNxQFEawkWpa4U6ANYJjBJCQQknxQhZ4E46WAce1xVo7ENIRFh+/CNSF6YJ1mLW+VWxlOVZmrudqmMif+SLvDlq9BqReyF173I2C14VilY5wpQItWehjXhPvqo7vWe5vMa6cLJVP5XMfmdfz5pDRCEKw5X9HxgOhavF3LLDIRzsbrJQuPgUG1PF9kvDY0Cc5x+fTzEowotpHSZBZrQBBE75oTWMQKBNaR8oR3SVib1OybZapoHufX677z3iKZ3rBeMexJT0ne66nLpdm+ouAvLGPWn5MVNKErFctkoBZc7X4pjpZJcIWpO4XWEKJpqq7m18FTCvlbdmAhyxgYGLZKHYIZHqWk=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xTe1xPN/VnWbCbVkJ69OXinJjQc/xfgPG7uIeLaoJV3WlV5GCRg3JBiK3tXIQonTq8MyczHwhd0g5f/PzZSpi34dd2G0JkV3qa6AHDOek1Ox8HfA6UQt8Fnrw2BNtG4cyw==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGot4S7lPq+7dBrRdEGypAAeQRyS+a7KopXiS78ZP2oFP5xpiRLPX3jGCIfz4RB8Oe1INBA71D11cHjjnLxmYi8Dt81/FaLikHi70fBYJdk796DK0u9bGwCntl20f+aO8MJBiAhL+9eYHesLxCf01DaZaz0uID7dHcs9XhrEbWrWLVy/zSD7deSQIBh83TtY3c6FBfTpme/YVhwZEN74n4G7BpXtqixIJLxKq8AN5lvtdYPeW/pkkc387t3+g15cn3h/ISUSLtz2p4dJA2AYwSRrEc3I+bDJuyNUJyO4XppNk8dhquM9Mjt8p2P8N+Bz7W+2lF9MWpjz9yorqm1GXsMx2mZzGrdVd29H0AWCESWPo=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2DDQD+Gv/5aPd6nE+MrfQl6Mx1fv37EEFx8n6uWaJtDzuWBdAkqH/Jsu1nc6GGbj1ECbhQlu2D+xM9x6gBM71kSkJJcdL58JejxMKANPE+nEWYF0KQ8ljivPucLYN1sdXsJiqp0Wp2HjDTQTIQhizochCMa3pX/z5cJdsn8TBm9oYYizmpRTarIRf5ezGQ//mRw7+v86SQpxKvlRrcpc9g6NHmyGyUauvpA6o9fp1gr8Sh9C7PUPCdF6mPwOR4RuXs=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8JQoPadc4xmj0KPgtk5CAeVtE1CBt3r5qq3lW4/aM24b6GpzgMadURHKCzvQ0dY50ZbaCFsx3zwLT7qqixdJhtd2L3yx4+Ovra8naqdLay+kGo5BjiN/ghKQXiYXGfHlTUUTrtDRK6MRc0Co+YLmqZiaIxn0udD3sqr7SlRF9wSYsC8Vp97OqDDUFyRKaGIlc5mOmVa9hEgm/VWGG0fYgPHE4M70fUgZam9aCYfGqPVlkMt4hDzH1PZ+W/d/1VpXH6wEYNM53Qvt4Y7L6qgpb4=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>