<?xml version="1.0" encoding="utf-8"?>

<dir table="ttclkktd" code="stt_rec, ma_dvcs, ma_kho, ma_vi_tri, ma_vt, ma_lo" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhập thông tin chênh lệch kiểm kê tự động" e="Update Auto Generation of Stock Variance Information"></title>
  <fields>
    <field name="stt_rec" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri_x">
      <header v="Vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo_x">
      <header v="Lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>


    <field name="sl_cl" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Sl chênh lệch" e="Variance Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="px_gia_dd" type="Boolean">
      <header v="Xuất đích danh" e="Specific Cost"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99H/9AFeDGGG5dWWmmDITcqbRMaSiLnLvsVPXf1YbR033c6aHNJrJWqIOgD3tWN6038Fcne9hl6LzHIwgCc8yznwdOlLW6lm/8l1fPTy6nc8K</Encrypted>]]></clientScript>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" align="right">
      <header v="Đơn giá" e="Unit Price"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99H/9AFeDGGG5dWWmmDITcqbRMaSiLnLvsVPXf1YbR033lxZONPvPy3gEh8F40r/ZNToipxjrxkUTl9GgaRrNES4=</Encrypted>]]></clientScript>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="pn_gia_tb" type="Boolean">
      <header v="Nhập giá trung bình" e="Average Cost"></header>
    </field>

    <field name="type" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="o_vi_tri" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="o_lot" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 230, 0"/>
      <item value="110101: [ma_kho].Label, [ma_kho], [ten_kho%l], [stt_rec]"/>
      <item value="110101: [ma_vt].Label, [ma_vt], [ten_vt%l], [ma_dvcs]"/>
      <item value="110101: [ma_vi_tri_x].Label, [ma_vi_tri_x], [ten_vi_tri%l], [o_vi_tri]"/>
      <item value="110101: [ma_lo_x].Label, [ma_lo_x], [ten_lo%l], [o_lot]"/>
      <item value="110--1: [sl_cl].Label, [sl_cl], [type]"/>
      <item value="11----: [px_gia_dd].Label, [px_gia_dd]"/>
      <item value="110--1: [gia].Label, [gia], [ma_vi_tri]"/>
      <item value="110--1: [tien].Label, [tien], [ma_lo]"/>
      <item value="11----: [pn_gia_tb].Label, [pn_gia_tb]"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI2vDEDSzkw0OdWACIHxRMlgBw8trj2nrY5kZIKTcORM597VBu5yTdSMqW/X7r9DpR0VsBTs4+l4MlCGy6xCtzHY9nbEJv2PuY+PVFG/KXNy</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcK9OzsId6IRVsfI0r+ybYg6U7TVABbRJaWI6TBOfEyNlmAVmRQc9V3iYKd2ayqdnsYQECq5Y4DA+u4fA7N8xltuGmdXq5KQr9mgG3VmgFh4O</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH11myBEw56Zs3lGdWcVvs0D1PEQ5yTsa69vonbqAp8f2UyUuX1W6vaS3ZEwttIB7jRpf65DMEgEmCzZ+StR4u+Ml+wGmP/Sc3txLXMvA5jUkUq/N5TA28Vz46Ze/nAk0XdgV7/ouAQdAY1pyaOlArTuChpyYpe4q5ZSKd3fEt1lMEbhDPABIeLPwY7E+IhGyC+L6flKxMLzS6WhTFXJWS4tj51H7Va7SawV67Po7gQyvZ/PisA5Cvbtmo1zQ26qvCCC+7X40xEZr4hTQEF8WiewsvqcIU99kiYq+aquP1l/muh0cn/nxFZGcQp2B/6sJ0VDLI/CLn4rifTVBDvnHCEi+//9mjtS5mf8dYKH6etuDk4wjD8bI17CVYLs9ax5v7gsmIDm53Kdh1MEKRSfBWCwMg/WNmeiPAjtgk3Nd1zIq/v0Q55SG7EnyOc75fkhdU2vwdIlxenefI0EWPE+CC3EvZ72XITjNWY/+kEfTEe9d7LohmeObDTFun3b+Omd2I+OQ45B6Pm9MEwyKOBf67bNRdmJE/m08h++Gzb445u32r+yrhazLQJLj16wURz/gq/75pEqGXYNNWMGvflwfoOW4GXlamG9f3ds4i/S553cWtpGiN9F5tDd9y0H8zAWcXic5BAA9+hmG7xFyIbgRNG5r/QiT2mcxspqLlPKaqGwkuePvWLUKqJ6xViHARdqF90x2abPPqQcDvDAm/T+haNttNU8ktnoSXvWhj0buE8jL+3V0KpslA4elHrfyNzrkZz0YELI1eKdS8lwk1weRRv8KXfQyEkBe0XZCsIsg4QWyy0+/ff4xvvgnkaCWCjpahUiU5TuNb/mY/bp97inr1yygW2SB4Q5Azt++OfKv3grjkW+hilgqeRdHXdeLzg+hVdLmVSz1BsJ/d9Q/YhnPaJoeYSg8gT/VE1RbpL3U5rhxHcJebKbMxby8syboJ/I00dgoEjVM0o76cHYLpYJMk6dYCzG0zbLr7vpVOkdXxYuQ2HlMlxZvdcn1r3rGrA5c6v2ayrXc2MSPL+FW/5ta7SmzQOCzRAloCtsJe7w3q1iO4FunOFkMroadMEb7DplCbPoAmNu4GByl4V6TsvhA+nIYokYPoXlZlnoidv0iEKlrU=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRDA6frcNfQfGvPxfd2h04nNZAyH76jp+7EgcyMrimQJtE9kJt1+bAS2jygwU2jHXtF7dCHOplxX3zPnSfznqXP1mjHdZ6HYTois2LNa1QWTRAJdYQ5OQCP6d6uvzQ32MVSdKmCZbjI0TjZv2xdGqykl1sz+yNwNuNkj9NhvaVWr26peTUxXEWb9ANNihWN/L9H1oRz0q+P1frfjyTtcRIPgC6neCnbi8nlQ7CnwzgiHqq698VzcNYIQ5ye85xDRXbINrTgRdbAtxwCH3RgyYD5fMHdv+ZIYwcBFk2EXimNU//l+/X2gs2ZbNrE8XfPCmU8SIWi8rIczqbJO7AWtj1B4knV8lEvzS4yVK37j6gfpUTRzZqtiWjcgdTRkBdBimOYizY9nWaUOJL009shWOQhk9mLxgHMRvsGIKMHzWZYvqNuryottVc6cF2dsdbvoexnGvZsrtloDumaCHivnMUtAbOB9h+TY76OxP3Mn/PKT9LH/TMD4e3MaLhbvr8I5L4Ah+26yo1jgdlAuKRZteA2z20+A+ZLcuV+nsCNHOrqmY4XrKOtU5YrxOzc/CqbQqu+0LZP1zpi/n5AO9FFGsE2m0q3SlhyQi5uB3Y3Z/QShTn6+CA4fHNAUK78VyCQb8gB2XGPGstSPXFDAn4xf3pnYQav3ITFHXEyDPscO9SEd05aqsdyhj7p/Sb4nth4ildyJBEb4x4DNTF8lkvlBll/4IbKtzcco6xQSmrtc4HxayAqgtp+npVGMlMadxnSgTN1+5OC49vrQOFDJH7djhfFfH+a3KxkLxQDZnniihDEMf6lu5Kfh5ZnvvWLUxEcA5Tz/0/fVF2KglIMf1RE0MfSWIW7XzSYilufkOMDxnsRyJA5SxUclhk65kXddVqSiEIFfUF+11C5rL/peNkaU6qtJ+vkEiiY313wg06yqqizfkcZLmHDb3gLNrsU9k8sf42+yYfYjMpAsx4ZNYb4KM8grCyEuRV74Wx1hhhbq3poRR4X+vqWNqEHDGK2MougBXmnuTrtR7JzzZwaSS1MNKVzO3+h5/e76FIKq7luCaDEBwLcdNGFDiqgwE5BwocLELXLD4z4uGW/kn1RMfMbOX8YbIleFfmWIDbtasYTVOjjr4T/z4Y12NzCNle9LzZKaIL3Yc5KnLZqlDfr6pp7A14QZelQ89yorgYDc9GCgNJ8rUBWKk4SuaTmCBBW7uqYu26p8iEXECFdVh64sBWxpgBSCdjsQmyNEdzHvxFnHkP4cZpzv3QDzaxphKit3+Qu3HIhAAp1kOvGKmV0nCg5Jrty8ZjwyancUKQ+3PWnDlbjQOfuls7siBZAxCkzOYB+nM82Lrw9U65FiyblA7/I2HzFlatIRvqcor+8mfwjRgU2GYvXAS7PA2OFsqoAZxWgtEge7N+balHDnP0EZZj0XSHcsPWxYjhyUi67FgBmgkyQ+3UXzRzo8pTMN8dkqHNb6U/t/NbVeJtCacXnasBzPF2mDl289m0d+EI/bYQ3lN0HQ4EhQbiP0V/vHLxO/8zO5PEjNdWlRTSlUahvDK3fdyYksApfo7bBi2Cp7nLfJZxD7</Encrypted>]]>
    </text>
  </script>
</dir>