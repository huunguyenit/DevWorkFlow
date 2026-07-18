<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PKOrderMultiForm">
  <!ENTITY ParentController "PKTran">
  <!ENTITY GridController "PKOrderMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c95$000000">


  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_thue_nk, thue_suat_nk, nk_nt, ma_thue_ttdb, thue_suat_ttdb, ttdb_nt, ma_thue, thue_suat, thue_nt &FlowMultiUserDefinedFieldsCopy;">
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFxAZzBvBabs+abMCmRAI0680j06JTImJKmoX4AUYIVX4pHBqKO2OcM7D6y3S8ZhLQs68W+ADauqUqDM/gqvlwVnrU4aKB+Aoammcc44aJvrnCfOl0sJUKkVnw5Q0oTAz5gDW2xlQGoDalEnw7+gcUPSJzxX2N/WeRX8kdn0TT+LR2aCnYSJ2PKsJGhVO6vTE+I2ai4YgZTRUrPP4vQXAmW6zZwJa2J93nHSwqUxuEc4KlXRXdoLRezWu3AsyUWYNTkLiqhNujw2RplYZ+LrVKQ0ylV9jqDYFJFrvOifU51ATA==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFcvaNbsU2hhlKbIAyv9yhaPg3FXxLh7QG7QjhUuiB3i42lUY6kJQsGyhd8YEKCVI/2cxlLoiI90vGRM7mLvdnoYmf6qu5ai91LEFwmBqF0z/+Muzg4sbE9JCjMxEGym20Zu9vwUakjA/6CBhvknx0aKOXZXC/Ir5qgJGYM/1xxj8qlu+Ty+OD1NobWIb0dFVCt1KdI0F5osReJJxI4lvApudZgxdHjRi45lzhZfwqQHzUhQYrzdhx8kOzr74eUsbmg1Te2G+9xTWnu4vwZkBiqYcMT004SxO7myDL5KUfonr5rfowQbB0yzJoAsY0N233wHfnWb05Hj0wg8SooA2Q3KSWmYp9RjN4eHrVhNh+3c3GZkY8Qju0tEbhSxipl1l7sJNbXvf59oSWJEr6efr70N8DAJzR5RKbUj3Ygzu0g9JqCX9KhLPfRFDB4r03rxUifuQxiwq4OPWqKXc9X38kL0pb8YIInSu32Kp0zYaCKPsT792nSPETUPkZ6f31s5eTX6DdR/KQZCBBqZP7JpqwnIik5Abn5oLUDDFKphuoCB4L1LsM7+P8VEpP/3XagREtap4si7z3zBOtr8oLz/SLnzmdSJSzoPJ4vI6wKqD7Cm87VMgCfviwms0I4uWabG6hHJbnPLeT8SuCKOWXMQHS6yov42SRjmXVmuA49VYcs0ZWi/pHujhz9bY4wKQfUyDEeKwxq2gVmPCIT1RwuXjKFhZ4Wu3fiHMeNFpmH1rgrhlWuUMvD4rr0yZDSqEsTHBeSFpy+0mV/IuRhg70UTrcmJBgl0faW68XTWpQjn4u5jTkzGFgL9q+6XJMmCwSaV+hyIFmqEwJoHcSkCIWXfh2s=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xTe1xPN/VnWbCbVkJ69OXinJjQc/xfgPG7uIeLaoJV3WlV5GCRg3JBiK3tXIQonTq/jDTb7N3/BqmLXGYcczr3TBc/sHNhdSHuMlNUqQ2HGEX+6kUuKg9ufUsAxiaLFRqagl3FGljy8rCvhkn+UJ5KuVSdQ4Q6eLvGNj6MoxrvXO</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGjWcVFViii0jf8IUeZPrIzN1VCiHrA/u7qWJhrskIyot0RG96267tKIBe7bDSXxxPUQOwRA6PC+oJUUR5BPhaxyoZid110C2ELSop1KrdXy8Mytw3yTwSVp+Jus94kuvfkK0e+SwxqFRmeR6S1qewxdSh9NUgOi0vW11BnoUuyZuZ8YBbz3qnSv3v1PDsMzRHUeHuVuqpdNNUIJjWOYJlwdRchlhEi4j+g4MNxcLBEJ/k8yHuthTPxuOkajE5cBfQer8K6QpK+J2Y4mBh/mZvmxtjApRl51Tmf+hEhCwLG940L40Bf8aHWNkxm57RVStMY3XH9kqsBVp6V+heEOTJv7wZ0s8D6zXCXG5a/aVtN/3QI2lRuhr+JbAfvbh1RL+C</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2BYw4ZTnenQGyUf3WncwcUujEiMAQ/U9xJMyvEKQSRQctCkwHbmupJTS9XzLATd8CR/1pRtUj9BynkYrxPyDw6ufkbfe5HVI3YIcNMnX/eF0E7fwJ8O2Iy2d3BVwl1496JWyMYyc6sqrbVY7HJXt4Z0uEZPC0LhHkz9TKXX8GagbOAub+UkFdPFK231q3giMB0kKOvp5Xetz7s2BJpzWeoQBgzGU0Nn5SZ5tx0MEabuFTPdo1FtnmsnZPeHw4rzEBI=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XSZvjMoto7NZDvS9XWsfFjYmaZx8VOZfsw/jRB0Pdv/e8+zLbNnKR6DXMorhFjFtn/W9/jBVsDmuIP5Z5lGj0YnDdxxAMb8imngOS6mIoonFJS+qqQ2KoRgT7mfLAt8DZWPTv7tp7Pntzaqf8eXCr8nqeqsh/It7t0t8sqqdgtoh2/yz3vWHUylvO2NHkDKHcJ5xRXQESKUmwMFGNX+RYU=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>