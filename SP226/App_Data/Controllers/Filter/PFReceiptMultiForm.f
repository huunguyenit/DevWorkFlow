<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PFReceiptMultiForm">
  <!ENTITY ParentController "PATran">
  <!ENTITY GridController "PFReceiptMultiGrid">
  <!ENTITY Tag "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % FlowMultiDetailTax SYSTEM "..\Include\FlowMultiDetailTax.ent">
  %FlowMultiDetailTax;

  <!ENTITY FlowMultiGeneralTable "c71$000000">

  <!ENTITY OtherCopyField "he_so,cp_nt,tien0,tien3,cp,hd_so,volume,weight&FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập" e="Filter Condition"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUsuPjWeB/vPvw+UJwZO7tBoBy1aRouhd8U+9PUp0XpnZUy8O6fFuT/fumn5Ord9i/z40Oh7GryqWq6AKR789TmPwsmlq+obw7sZyqyYnZMnDCUYUG7Td7N4rmFe6+5KYL8r02qhEttHoxtAt0g/upuYFGPM7lTHLmKjXgWTTijyme3TRq7uMGchoWG4dHVo8CAqWoG0Sq6q0m22311/7YZWB</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHykTz7ILQWDil9KsmwpT/uBdtUKSeGi6poXyVUrtduW1yO6AVomYUenVgse1SslpEw/NYexZpa6aqFF87HeIb47AciGfyk1D7jv16bHM2UGcsTqCyiQxys/nhi72bqVCaaPjQbIFCfo7S0ueaSIGRTVxlFrCNpPj/ThzJERI8nVPomU6jq4zQdSqMKDTEQ70KTlRXiTLf7YsMs0qoNZ58bK0ocbS2dGwR+ZAhATX6zKkWnpIwnrP6pq1pCOvpcm5pMHEt9mBZW8ZQXext6svTikX4/qzP+nRHUWsaeCNrigLjujKn/1cfIyd5ddr7d2rF3hquz77rjj0qW8yY7XR8GYAkT7/wyEdvcIY/vl/Tvm4U9nCikeRIeCkoc1auIlDioY0Kek7zCHkXLpBwP2sYN1KsDoAFEOMjuN7bJcBUv8w+</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxEXra3yWa40q3dxg/LeNJmSWWaAsgi0ihMVZHxR23Y85eqCUkszVzbOMm75e4yLaCj7j9kaZOPB0XZJNKb/4hHScAOU5oDyvAwabpRiyGIVmiXUl+QBXxM/R+VZBM07h+glMCqK4/evjb1r27DFNuW</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbD7vg7h9reGaYv5F35+yw5W033H88Ln1oTCQaYechKcF12SH01gSZ3SJiwsEFIMwMjbLumlGHySShcpiP1YpFydCkpTobEl1rTLy4I8pf3tav1YF6deCqSX6+M8/HOpFivkl5CZnkz7VfuzDEGhyb6vKQJDP1vP4w86kTc2yrWvt0/rxytQGotZBVuMtlP38eK+sldrGikdaLimrpYo3Toftoiw9zMG2BY3ZB6PfeeG1UlnGGM3wj/LmJ8s+V1Wl0oAFC3C3bv7pQzyUiyQ18QM=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW100+Ru4O9tu7U0S1EkKaFBY1uFxq59vHezXvj74yK/lzYFa/6YiamOJyKdSR+UeR7uesAh33eQfVpalor51leOdem8iffbkrjxm+kno9zVYFxmhSJkLr/VUWezv8W9sINQGglkbzrSmtMrfXh3Hg48pcd5y04AyW6lufySy++RNvB7iqtNM/Xj/QM6GYBXKewJwhc6g2zxjU1uKZgGlNg1SVQqPBlMZPkjl6udKjVZqflq7rEpgiOvNZY6INIF5W/I2fH7laO/si3qKSorDqy9FnV03GdaiB/V9HT1uctIG7setShRh/ygMDhZLOCnjFX4JqHUO06a6djP+Sp+CcMWi99MZAJp9HL/OJz+TXx+0Z2A9lvn3c/3i2aL/oJkz8YTRq4RryLzZEGHlonrdDqBwH0198uOltV/zcPB9G4zb1rsnsHbASuYk3eBZ/kkbBImP9bGpThj7BfSvnb0lQPqQ==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLscCWbRcZdE1iJmWgnEI5X/BZp02nc+8omrBqCo3ec1E8eqhWj5Pn/+f5wa9hBOf0PhyrDY9BbrSwcNit2+WPh0HlHTBIHT9cAEQPHXqp8LQALNRomsJYmeC2McAaeUEtQuGUaAKJqoD2QdMnZ/xRpI2rdQlJe0Li+VRRS4q6nA4k8b06OmFpb2LRmcaWYNu94R6Yp2w/CmrCKfIMfP4M4=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2A+6+GOjUKen54HgcSllbz1f3oUO/7zofqdV9M7w1x07dKacuXllAGAs5cplwDRaqsTBNoySUAtIoRI9b28pCt8OkXMgyY36a1nJMAPzW1kCzXRs9SpIB+/Ds5cdhbgwHr4UPLlwoc9ErEsoyXnjn6nWQTKXMovIK76iojfnye6PJ+jukjbINYqqCW9b00lB8RKnFfDctphCyQ4vghOm7WSQBtjNikHJwgCb2A8Rwrgm9jPvMPPoaN832ea2vMcFlN2uaSDU09SWEvNWNDI2ZmfADDkaZzR8+8j5S5T0usXTA==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>