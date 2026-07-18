<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PTPurchase">
  <!ENTITY DetailTable "d96">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập mua hàng" e="Purchase Receipt"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="&c21;" e="&c22;"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="&c31;" e="&c32;"></header>
    </field>
    <field name="stt_rec_pn" external="true" defaultValue="''" disabled="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: stt_rec_pn, stt_rec_pn" e="String: stt_rec_pn, stt_rec_pn"></text>
        </item>
      </items>
    </field>
    <field name="ma_nt" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="268" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100"/>
      <item value="110--11-------: [so_ct].Label, [so_ct], [stt_rec], [stt_rec_pn]"/>
      <item value="110--11-------: [ngay_ct].Label, [ngay_ct], [ma_nt], [ty_gia]"/>

      <item value="1: [&DetailTable;]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9JZdL8G59SoqzF05WfH5ag3lD1kBuCu8cHL4UhzuH7Pg9Lwi/dmQyl3ihzhHR2f2/DP1R13oHuTO8c5lCP0yGOEUzCa4ZnFfDrbXoauxxw4mk+tHgg9/lU3nM87zPjPnig==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87lxdFI8JeKgtlPwSXTCx2Ttmias7EFgcwnnSElVQsBcKw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1EpYSloEUvp+K0DgEsCQRAt5Z9Jp/OWtTcS9ZySVdavQcjka7jyGcxys09kV5w8QVINmwwigtVIOf2F0QCF/MdWuUP+9RC4ziBDcVoZPvg/zJA5/+1Y/w6NYEGjbPkIzY+z1fRhwimH2+8dB8fBxrDnhm5nM4HdJ95cljBugHTv/Y1kX4lqVNpZp09juYTPUuAA+Us57qoAYsFESex9UsfQpXVAg7YkWP5rlCiOxXJJ5A==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2OAVZfDvKUy2vl2bHeGxzLQUZgDEU7N/OyAToq+4ayDt</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOKAWjqxOqvAVIHkCB33P6ojltr9nRNZ0PtiPhubxXbiZnTXKvOJnj9CLsiLpRksx/s=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKkvEOhbrnzwwEkdScw5cZzFP/v6GyBKazTd0g6IAvnPEqw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ks+cMykz6XumP0keQrCD4guEns6zd2tdJQefBUElELIl4Gbcx7AI4icmeITbcGvcw==</encrypted>]]>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+MFSpcvf3CI1ANcjEN9u3tvMQGRiZcdUxCinBc5oydDEg6GJBvWTO7v3ogCthD8LsxNidUCpYgQM5lcMYcbXTLbDp7LCzw25evgYKIP7PDExSL+Biwic/ngYkEJfZy5Xv2cQPTTKaV5PYGecFH2KZ4DZNe7LareSu8nu8nlTTomlypZ/YDCmvLzvNT8mBqNvpFsQ7njhiAHrWVWtiPQwgpgyXEURv+h3FD94o0aZ38tclnVoq7s+smEJm/PWrt93dDhUU2Mq6/uW8W89MdeYstRX/pz+s2SupBZjVULy8monmBiYui0Il3fkgsM9kB4vSlq70+kale2WrPiREpvJMkUxnHr6zTQInCQhKJAt+Lae/H9+kemj5WcZN6m7oiXJl</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M3QJMQTu37x7tZFlyDo0IrjCLSsN2o30g808Y1ZgYAE/2cPot4PDujinTUbi9iVMfwO/XRfAHH+vbvKR+Dd+DDNWcGiO4JP2+f0SmObQgQAc+Sb3qwHDaAMfQRbISht4NO2LmODDCGKsnlBvpbEOFPQ3z9c08YfEVq/j5eWaLe8Mq/Ee+aKDYPZltnOk1V+eBCLhriIVJl5mPEc0uCqCXr61vg4pMcXyA8PWnfymdlubFJOoAm/wirSplq8iO230rZK9KYkRak0+jqdtrzY0D9uAMetov7sCZaz88cffYvipBtXtdiAiCA1WLdbr0h8+ZCE3j3TlHka8cpCQq+Lj08A/mhwTQptpDp7W7SKVidjkUXd3fi2ZZm4QYtbuoiUq+99pE7aehGHQtXI9VoAPDrSIjn3Em2KdYZ30oVUDYunYXxKM7M5xrXI7GS6Jdo7Of7AaE0xlkK85zpjKbyXwwhn53z5ss+w7w/PeQ7DeF7Yv</encrypted>]]>
    </text>
  </script>
</dir>