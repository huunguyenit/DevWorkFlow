<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "ITMRMultiForm">
  <!ENTITY ParentController "ITTran">
  <!ENTITY GridController "ITMRMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c87$000000">

  <!ENTITY OtherCopyField "ma_vi_tri,ma_lo,tk_vt,nhieu_dvt,he_so,ton13,lo_yn,vi_tri_yn&FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu yêu cầu lĩnh vật tư" e="Select Material Requisition"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUsuPjWeB/vPvw+UJwZO7tBoBy1aRouhd8U+9PUp0XpnZU9PEFrGEOMgqHKlGeL/+CnV3mHDV474hxim/R9C+8JjnfCW3zSHCfJQhBd7Ez5kh3fCJSwX/Zks5XqyQDpKOouVeOjpmqHbFuB+n9E3IuREBIVxfIOQX7scrydICZFo1j9M8oFUWQACPlgirvluDngQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFtW3AlcYBSRjN8xhr9tyIz4hZ57UBOFOS7qQkPc/94Fy6n8vjWaif6z1ZNGJRuh/FlqrzCQiGPLBrpVsn+xdrCyJBjIJ0f/C17mlE1ZllXnNcI3qbu+Z6dqIn81ylnCD/Nqf8pUP0QAUHmIaKkS9N3ivnTCg6d+y09Fw0D6DKPyA1apnpL6Hh1F9SbVphM/w8Oj8DPb9fY/lWMMeG58mK3Tbp7w/hmUp+F+KDg7DDrOxNeuJV9Ns5EqPiT8DiZa913yCsOv9TZxWby0X27zL8HWcBma+MD0UB1p60puOzdvrvYcAPJ6azmQRop/GYvMYwtQrtpPiPwDjge0Y41AXxME8Inwq4nnkPy7hIcBb9t9urv49mqkn8OIQZKN1lQi4sk6KKH6ZpJ8XYGlNL6L3jyqBywJdk8BxqSCxA0EGmj3UZTtaR6Vy/EeYSBo5sIUOSd8Y78uXKeowwo4d++EfuXb/7PCduTjf+7H2RSfFgO3DCxkTiSARSTdcyjCYWe+Lgk83MXqL5JWpTgFZcTDqU5svHyzutbDE0VA1Oe2+bLAhMlwmeLuxhMv/PNlnFLfOTuNX4k5/JJTmvNFywctpuy5/JdiePhosC4xEE6P0hStR43d8EMm5czxOuyuFD+exKk4IbJSzEajrdzLj/pfn0kA==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6Ejl8zko9cbe/JXzZ8GKMzy3y+w00rn5kwXGvDuh2H8vpsuARaj5VMSVwiD5+hIBYdHJC97+IxzHL/qSLmmxDvJq87ah4EI0/N30MJkMJsOHgNWTMFkBHjv8WFm5sTGMIbU3lKpAQvc6E0gCroyXdatL/JWB3o3QG0sSmIs1I0CSW+xinA89pzrxcVYz44DLleBioQQelKiuNm0JBls3Ggt0XHmNyhFc10xdJ0aRr47TEhbQmiioTub+LYAER0BnnNZDbfn63Na5CywWNBOYJXft0V9Qno/5EdlIf6mLU1hA5ZfhAlOG9pXxL1ne//ciYj/Qpfx21Fu9Vrk4XWRcJSVQ/a5CsnhdwzM0xPLcDWLd9+agm0vutDcK1qw939AWs9ozHuyZGMt02ZI6Vh2hLNNmaBSYc5UqB0g5K6l0pq85QWWqUb1uQmy/VtIQ9yrngv2RA4tnVxFrghMMKpbu6AtzfBYiwE+q0Z0cYKd11hl+AZDfROeZgGRnH5sLhmaB6PpK0dJaT3P//7c54odqkU88VZeVSE21y3eoNFaJcoMqJNT/O3AvpIRznxQEnFUKmRZ2+R1aAcwYMlyI6v+uKMxmfJnFjU6FeSyRmiPaK/zHD2Ee2OqdAuaeVqbRVwVg5+luUHKhnPMIYR0gHVCjuCp2N3qs2sFUMu2Pxg2TPRigyOndNPf2mqb3VdwzV9DTpWuLOqalLk07/wiwWrrB00Y8y3p5EhXsDR1K3igexCDNTQFAt6C75T2j9ngrvNZhyJO6nTnmPgDGKVK7oN4uVt0=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1RyD7txBWX5CJQkA1vnzVXLO3ENowdYfh5kEjVJJ1If5EmnrKNpE+o3UdKHdKSrxWJiS7xxPbZ9vQx+Lfk8OiIUzX0sZad0v4eqyYBi4Rz6bhRxrBabP+thWfDM+NPL38hGEJyFPJBlQFPX0Twkr6gYVDogrkQMSMKSxBn9k9l1HY3Tn7VYz93FVTjOacjLhu</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLscCWbRcZdE1iJmWgnEI5WNFQJuYL51bNRmT1AhY1gos09BPpTOtm6Hd0NPWqbTxsxD+vbqMqdg9tf321dvrVoAigWXw15lpp/q597NMebyW3e46WOaOtvDyI/z7mOl5+fHxh0yfwnEllARJ2cRh3BRdh7KEbEcNpgEpmAF/3ZjKGaX7mcuzVkks+OZ5qdy09m1C6qLN6DXwl3phMmTHAo1CPArJ+VMoZphHJvrtkCDfFUSc5xZcesrvsCqJ34Iedl7Cr5eZ9c/MBFDjREW9ySEmwa0yNpESuh2vS9jfsF8aUnYxvquLwG02zcc6LylBA==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2DGJfGPGEDZP8+Mri/Supva8Ff/BPaX93DhzKi3eThYK807qWE95c77mrgNZPVfueOUClfC0vFlvpat1WCUH9qF+vZ9wpB2rdg5HZEuGs9TWartsgn9y7vYH/NaJK2BBRLzRe7B5epCOOkJhyEXaqXEfpZf7efE5EmoqB2UPfd31v4QgVmvCZ5DUy6Cq9S9L5AEeNLwr+3m8m8kdwkcyGkH8vq42914GZKANitRlKJIJnkuR6+Bn/m2tjbEqf9A2c4=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3DGXHfkyQUuOQk79DyG3Rjx4EkDSbfvjQRj7GFsPC6R4tfwpVLYUXspr+S6gsVMfDJzSObgmVmZ+QUEQkKmk4FvoymKfZUllkcXYGDaNsBLpQma4x+JFSJ7hBqBNm4GVA==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>