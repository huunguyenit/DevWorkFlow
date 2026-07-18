<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "WSInvoiceDomesticMultiForm">
  <!ENTITY ParentController "WSTran">
  <!ENTITY GridController "WSInvoiceDomesticMultiGrid">
  <!ENTITY Tag "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c71$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ton13, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_vt, stt_rec_pn, stt_rec0pn, pn_so, pn_ln, stt_rec_dh, stt_rec0dh &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn mua hàng trong nước" e="Select Domestic Purchase Invoice"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFxjDPSkh5W7G443vCi530xUsl2d/3gZLitrQ1igpzS01eLda6cDOwTySXyABFim8/nuk079CmN67EeG/0ROc51sViN21Ysxm8aynqH3uwdgr/ui5DRGs3z294g0Sy5Zrt32I1++GsYpBmMdbHjDQDlclRzo8lne1uXRTMLfcZXDzyopUu0/Si7Lo5O/XKPgpE0+HU/O9Vc+JBFM+zVWfjfEqAOeNpwIljmxd0Uu66aXEuQMXckf4WuBxVOfy9CHTPXxsQsGFLwWCSjkYkIMB++9OZKacF77cDLNo929j/H4cq/Ya9w5TJgmP+VRtIx/Qek=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLrCo5nus0kUoikUaLZQJ5DXHtK1C00c9Qt3VCVoaBS1TyIfyApV70Lw2ROulHjFgjmi6WIlLOu/aZQIMSlt7GmWmOheh4hyugl2B6nbYLb+iFpVQyK7nNfDxqWCdp7S31Wfy7mNzJghBnmIkf1pcws9umDAOoGHAjDQmGDvsAj8GKxmMSWrbF1+p4kgyTVkY8RgYTxFVtWozuGZDZIJCnIeVwIoasgJermqUJmXmcfkK8nEQjegwEbnQ8zd74U5Al0sT2tlOgUI6gMNN+U3+N+vIlnBkfxj/jlPbKLywmR2ikhANhSra085WNmKJLE1KuLJfp3qQgALl9pq8oeTYh1T0CV+J5EJUmIfW9PxVJxOpUOiuzm75ltwnJks3wbWdjrA6+ogCxxy9j6FLbsUp8jAsgB15sc2jqvo8ecVtc8Evkgj8wDAFEk5mz8uJNrUhKJkAwCnR2YdTJ80tk6TkPV2TNS7wxdZLF/gHQ4G1sRS+IzDvjbu72XyRs66rMjHHM9DjCjTZOdiCeMYqTvYgbQYzybp4xK3nw9ZwTj8AVxg3DkICCvHbhFWxLjpUy2jhEGHg4Pt9LAreQ7GUncnL9h2A7LxaYyuCDGO/ZCcGgn/BM6SDBUP/tDFp4LftPDcdVxPkTs1NetaU28qlK6E/DtMEFE519qf8AEh1GRFwih/W7TLewkId9PIEYZnKSOWw5vacgGqDJDZkx/xB96r6QOVOYPrjR6EkAv+Liz1jgGhvYHabHzA1F95RA4C4bVubp1LQJvtFeT8fVrURCp7YdfTIuQ0UjD5Hp7uDcbA5Q7G14QZxCulXb/09QHdoiLbmMnuedqykFzFzLtK9H25rz6ea18azDDxCOUBiT9B5wTM5xh9SM+fUTD84lOGItk7q8cHRFxNypCBXAjJMp67rnhbfJOdAALsxOoyQ9kOqNP09zMJhj/g4jsy0OfEONh0qeSRmqfuZq84+t4cUiQpQNk4y01UOfGmrpkjFL5q4WM4V4UDW92bFigljXC5hgMQmsSV9KKrgZ13hptUkW+Ij/Pxx0Z8vdZ3WAaTI/CtFcRhg7Srdpq/usneytMta27pXKxvoAE5IVOcQHJACFb1cVLV5L98kFvcSM5hv+0lqfFdh+1b5T2nh0S1BejS5mCHqBw5MKsddvZPY90NMIAV8CWjwYwUF/8UAmeYoh2akpxynHG7662AqPoG+S5zkebilhAj4ql7rvp67I0F2uNCpV8/sCRZVa62GKA5N1Ta+4MzSg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUzL6W1R2jdTe3Tp7MBmO6Zo+Xgb3+yhk+j96OxxsqbfJeTYpbNWAtEfNT4jEcT2Xwrh9FD72LqwCIBd9av2KRUThNrZavssf9y3I2UOa39IKcLI/esivQymbtGAdPRTOFWb4S2wGqDtOL8XkjRQBaLg==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGFj8bFYmhgr1fAvdm4sg52S9WBm9CTZIq4V+4u4VXoFFZbpSbr9K+40n/Ql+3Anl7sMOG7vxeai+2H2r/phxXNf6Zxf4DpSrjuB2ox3ZzP4JWS/eX7TCjmaROTlzrsJLTyTq0albrrHUEqwhQ/x0joR35V62MBOQG8jF8/OMNYRLpX8IjftZNsBlvCYDJ/I/oeA8yYfZZljAJoFKTxBwIBf+JwvedakKL+xtTc2A9yaru15fXnR1UOPmCEDDBQtO8srSirl0p8ns7MbJTuf3LN/8CpslyxVYnCYjCGc5vjUSxZVA7P5jVLgL8Vk/dObrBLiodspJSXnqkDfYR6BfK4g==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2BzQBT2pt+hQuF332O/sakWaboDA4cNSlzHUNmymZa42osjlbWHWzHdvb8VR7PLWfjzi6OYbRi/Q9Fv9849xLunvqJpPthGFDF8wdPIzk+vh//ZQ2s26yNNqxA/qc5SoLGwyIAcDQvpu7sbBDixp1ElyUIuvjCmaWT+2jNJXXkWXr+RGPn8lCrTPtgBlcUqVJwYG8HUE9LQGiu3mU9z/Wspd1KvhzEkmALUiWCg3Nc22L2wi6/ffMb/O4XKIhxN32w=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3DGXHfkyQUuOQk79DyG3Rjx4EkDSbfvjQRj7GFsPC6R4tfwpVLYUXspr+S6gsVMfG/M0A8HT+/utfJg64qofC9CneRS5xnoR3Sd1lJD+W6jlN51NmFVxXUVcvew4QORAA==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>