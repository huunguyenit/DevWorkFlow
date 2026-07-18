<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PVIRMultiForm">
  <!ENTITY ParentController "PVTran">
  <!ENTITY GridController "PVIRMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c74$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_du, stt_rec_nm, stt_rec0nm, nm_so, nm_ln, stt_rec_dh, stt_rec0dh, dh_so, dh_ln &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập kho" e="Select Receipt"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFFwL5VzVbcWKYkv96sj1+nX/M/oZVcRAryMtnGfs0cXGDm0wJ8w5kiGXSP0FNWKVj7MOEjkn7DWe7ae+YownvtXeoS6RFWl1rL5I+7cTmTXoyHuMce6TkmJ0bluXcRLWztmykRiUwPlGEbnFIcCBbkVzkJ0AGwLlapqckSnO8+pQM0A5X6Jtlz2Kc8JZjhBLPb7QIGHJtaJDYr6HfcbEzt3hqu2X9CjUtArvCMQQTiKEBYuB6hh1YYrr+dKQfoTfKjzPO+nwcR1YpwTzmjndoFabT8gE4xHC2W3Eu2y+y6FVugMsLApr5weOaUceLF2VMI3aFAZj0U/hkqDXvWWKnvpuZ4IG+Xe0DZQhyAwV0kF53/NK8TcSEgeP7GF3SyoZpSnNGcPmuPgiAsH+Y+NB9YVkFLsWPg08eBipYMOpQE0g=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLqjbYXfZmPhZM4iEiGocV5hzHVowsnRdBT+/8aQ+ep3iER2f3yezE5fu42fN64sQcTNq8hdmpV5gW39tgnlGLWegC2vQB1d4pgVriAVFOsyObfm+AOQHnTQlPA5sY2zr0dFy47bXbyHQ8Vdj8pv9MnnQHSpk587yMp5B9C3UzQ2Q39NXhJ1VhnB00yhmwt0JUNhHOcM5j3egryrxYjQ86Lmt2vvxO5cuL/9i1ENLEjKogHO8v4joKXZxX2FnhnA6DBBkzGdObCiHGyvnIkkr4Nb9BFkE41z4iZT3g/8lfKwkNH4TuuAhV25nAz/Oo64PCDLZ2UT6GdEi2tmSGtuSxxW+INoAomQYUJrkunP1PRoplQ6c3AOZxuYpRph9eMmndI+EE4KiglwCwYaMGSwWLJ2ayDwBXFslgYuYB7ok3pC//JdhWaJNhGUjA9Gu+DYnYFQqL4Bm48ARIXKp3m0gK2yX88X8HYax8W8qGqEYmRC7weVkBO0HROGLuT4ANDfuSolQ463KzKxwFBXKo+tTllSSr6WcWyMt7s9Ypnr1qfnyl/xl1/m6xGO1dAkMEZbZ1tvFnvtFSmi6D7mMRXd6fuTOea9hdoGqSDtbYfN40Yjz2QDGiY6klGeD9HhVxGEaFj4uV2aoBnbcemX2Us9wXAf6okDgXrsOAUImD1TV/hT8fdAQoib8ID+JkJDL05yR7ixOO6/2dkdfwpSYMODU9Ka</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xa8IWiBR5jJQ6f0MLq7SvdD2eygM8ZtKOd8UxQx+HtFt9h2gFGhgkMTDfKe+hnHMH0Ob10TI73IWl4LvtGSCSFcLEFt51ddzVJbYZf0LHbxDUCsff/Pgk/OH17GcoGvnL+gK+bnxArC+kyozKrMAvQ18z3mMYvTkVPPFnDM0fjVmjM3NN3FMScks6tV2BOt4Mw==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGiUSd9DtfJ6jAr/Xt4GS9Q7Divi1FbfJKhpJ9JdDt734LHn8icvRD8zDRoRRTJE75DrZoPNWwGykAzFMUMCwih43Ocr+XFESxCXp3+muGBJpqMuiFlsJiKwnL9Kn/jwHk5SeN/gQAwSjGbI/9M4k4sqHu6zouhLF+WcG8jDKdI36WG8eB+4JwYPyt7twYxGNuddgw4MoxEJ+PRwR9MG2S718a80sJIBslSxJCIbpzwTn0L+fdLhbm4JL9aljEUYibfvDC7XGu0Hztd+FI5XqAL54Lpuz0ycdE7CwC+kgkDlBF7UMDo4TZX67ihT0hNlT6iYXFs/SexgGnykoeOJfAXmirZQRsmJUlZ+O2uxCfrrk=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2BF/odpEizpVwIeFVKO4SJOX2UX1EGf4aqaDWN0JehxCr4YWz63DnLCKWoxQYUS7VIK3fqSR4kKYa73LiHub0k0aeJq/bGl+SQCOTMTum5E6vD58hHon1Q7ivAWh20JG86GLWUxUHlDkQJhjU0if/s8Pjrx2LmuTCBcv4rmn7NGLg99/oL5fd0Xhpt1oro5dq7Mc0uIOTBfcZLcXZl5n8vRJ3k/vENW7AidSOxQLMbJ+ggNP/Gt7LzyWObolJvzwGC2u+Uh1ruEV5hWbtoFoMT3MWWmpfuLHU2zt4nB9sPmifhwfJhpa9TgHpXGanxvGfBSHk59no02FmWLhYPwhZJNIF4L2yt0UCEqrlOqypOVflehCkkPxZSMdS7DVAPCrRBqiYcVFtZBTQEfqaGIv/Rb6lKkl9X93KPXI38NicYL9RvrN/wP69aeTZYkeNmNQ1wv2LOY49AH5NJKOUUEifxCFPBEo4m1q3ZqyQ/v90erTgbiVZTbHN9ZR87OJL4DGfwP0DjCw4EFe4rIf2FZWWImkbFE8yeGYiYSfAGg9Gxi1qYcHBqByui3ZHNO454jSyZsDsXaKZUX/VM6TB2Dk49c</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA/vR4W7E8QKbPiDM8gRTXBqMfDyHw2zaB172Ku+6NlA</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>