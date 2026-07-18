<?xml version="1.0" encoding="utf-8"?>

<dir table="crdmtgsp" code="ma_vt, ngay_hl" order="ma_vt, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo định mức tự động" e="Auto Generate Processing Time per Unit"></title>
  <fields>
    <field name="ma_vt" dataFormatString="@upperCaseFormat">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1' and loai_vt in ('41', '51')" check="kieu_hd &lt;&gt; '0' and loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1" clientDefault="Default" onDemand="true">
      <header v="Nhóm vật tư 1" e="Item Group 1"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2" clientDefault="Default" onDemand="true">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3" clientDefault="Default" onDemand="true">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Hiệu lực từ" e="Effective Start"></header>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right" allowNulls="false">
      <header v="Định mức thời gian" e="Proc. Time per Unit"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [nh_vt1].Label, [nh_vt1], [ten_nh_vt1%l]"/>
      <item value="111: [nh_vt2].Label, [nh_vt2], [ten_nh_vt2%l]"/>
      <item value="111: [nh_vt3].Label, [nh_vt3], [ten_nh_vt3%l]"/>
      <item value="11-: [ngay_hl].Label, [ngay_hl]"/>
      <item value="11-: [cong_suat].Label, [cong_suat]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJoMYJdWiVhUlC4zE5Pldllgi3CHmrgWp7JJPap2b/s1dALG41QPCpLHQNTO8Bg0eKiHfsOjdAA2L/YeiemNb/z/EGOVK6Xc0/oZWYZ0fyRH</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNAlIa9yCDan+WVAV+asUqFq8r1ZVgE/wUy89bGb25/he8s4fZ0HYETMTxE1SJl+ePKqrxqP98j+rs379ExdFbzvOAjlhCtMKhK7JMUKhMKA</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ESqaTy3ekxRSQAw0+ZhFUpGwDxp7xWehD6gOZNmZ0irgqImHQ4T8bwva0dpilR4CQd+ujM3SJIGksR8juvIgdN4vaqICq7c5xT7pOIaqKqPmA9f5E9Wm3ppE3Ia/9sS4DSrPeBdbbTqsjZAdxTvXxLg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtbniBvNVyzNpvAlN3CgT3AacdgDJyg+NQkg9ZoEwJCSVrAM+v7Ly18yz04gxhJIOwuR6Y3ZTCK15hH7WDEAA6QDRDz5H9iRrg27kOcOqGalqnM5kvit08rMSscEuiXcJylKUVOdfC2gMuJ2WNpbro01/Tp8YKBd3kaJmp1GMIbqd3hqhTZtLYfMwDMssz5WitK4Wrjq/cuTUcBKV9Y/hXgWcSI6eDTTBtuoi2mZglH2sVUQniAepvV4XTHCBzUH8VEjn0Y0akVvI9CRSQHJHSecmQ6duzCC2vg/2VvEQAHMc2fp81wiAHC7iBsF7ZWaqsnFyYSjkXmhw21YbHgeG/uXiA3AwMQZI/EMGSKVFWct9bS2cbr2gTNh+JteAixFZHVD3nqAKjcqbBQPdy1raU307eY96ysPVLyyG1V/eAw6ubdFoXk+QHvNzo4Tj/+R70563yniMvESKlpT/JWXGwH32+TbLbZK9EBR5Gt8PShtHbHUQthyRdA57KVAG+zyFAJIMhxtXOoESjkBQi8OVpiyCfB3eQDhmnnKPD1HosLQlMKpBEHpOoOXAb6ervtmmw/zhE/V12bASTmeU1TzIrSM83rtRDRkrMFJWMmBRWUjkqpsIwwfTEI3FPNmnetPdGXLSoqmcmsIR1q9rEkdUQBo=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="CheckingBefore">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyfhTwEPHOjFCNxS+OsEbJG+zGb89olRa8K4e3MTcNXC628Ap5V4KTDfytEC7L9fqrdNBWbn5pML8Bv6Nu5NU8zBxV/2y0pRRBdfKnYgyXmuqaIjDLAeN+h4H29Y2EtQ1Gfm1thK8gmzi/Fl55gGz85+5gELwQ4I/w7OgicprmSdS/PRtIJQUaG7IL9NjwtAUgqadjLj8gwPhGGL89qdZry4SIHUmyC2ZYQ5fb0PYF4coJqNvAg0vofhjSO2Cn6yJoeOIb3qW8Oo5f4ihVguQsMHfq8mUprC8z5fmo63vOUB/JjahhAxmpoJwvLCoAg9hWqtUrIVkjFuYhbGb9E5lX2tTLd7by+kQVGOBeLW2T7L3Lk53hPwYZuKp4oiQYIA/iBme7Kw8iAFoxD9uMcs6qFHmGOnnDGNaiX5+1ZbJBkH</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>