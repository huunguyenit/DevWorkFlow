<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính số liệu kỳ" e="Data Maintenance Plan"></title>
  <fields>
    <field name="ngay_tk" align="right" type="DateTime" dataFormatString="@datetimeFormat" disabled="true" >
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_ks" align="right" type="DateTime" dataFormatString="@datetimeFormat" disabled="true" >
      <header v="Đến ngày" e="To Date"></header>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 40, 40, 120, 100, 130"/>
      <item value="110: [ngay_tk].Label, [ngay_tk]"/>
      <item value="110: [ngay_ks].Label, [ngay_ks]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnQ6JIJ0DAjKFJBEciny6nyvbflFD0u65L7R5eSSbe1reafHvFvFWjS9LVwPSidgMrSuaMIjkskqUL8chfvKBUYqYbAtXRdqk211OI+URY6HIsI+IUKTh4uGogq41aYlBONRV4QOJQSfbz+hXe8LkHTqag+LzEVFqfqHrdThaboU+Kn2LHzWmW3+Bd0QJs6lFf0BxfuQQb96c3+GJwovdLPPqCLWjB6TGIBQ15kbQHJSJAlfTEiQPa86vz0gWFLJJBZk3nTOXr1nzNFDKep+ACRtcRUoQWffWMMurPQs919oP8Mi1hNyFfwfh5RlMPWuDKtpwxsmuE/m3IKqw5huDl3</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNiuSnMegA1BDlKHMs8co1bO4hiMOO4tuqUy6d/9GOgCEW1VA99ch5v699zb+pgMYBjyoiHfnp1BQy0+K0ZEtw=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xFut3UFiUrAbxvQqYPMMrQZ74W/zyq4YpqZOdrskrVbHntO06cUJ/Kt+Rild5rhxHRWvRu6UdaUPE67UecQIAVQn23YGnX5M3BgBsz/r0wTA==</Encrypted>]]>
    </text>
  </script>

</dir>