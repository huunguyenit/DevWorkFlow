<?xml version="1.0" encoding="utf-8"?>

<dir table="dmmauunc" code="ma_mau" order="ma_mau" xmlns="urn:schemas-fast-com:data-dir">
  <title v="mẫu ủy nhiệm chi" e="Payment Form"></title>
  <fields>
    <field name="ten_mau" allowNulls="false">
      <header v="Tên mẫu" e="Form Name"></header>
    </field>
    <field name="ten_mau2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="in_nl_yn" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="In nhiều liên" e="Multiple Copies"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_mau" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" hidden="true">
      <header v="Mã mẫu" e="Bank"></header>
    </field>
    <field name="xtype" hidden="true" isPrimaryKey="true">
      <header v="loại" e="bank"></header>
    </field>
    <field name="mau_in_yn" type="Boolean" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_nl" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330, 0"/>
      <item value="11001: [ten_mau].Label, [ten_mau], [xtype]"/>
      <item value="11001: [ten_mau2].Label, [ten_mau2], [ma_mau]"/>
      <item value="11101: [in_nl_yn].Label, [in_nl_yn], [in_nl_yn].Description, [mau_nl]"/>
      <item value="11101: [status].Label, [status], [status].Description, [mau_in_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1x6FXR599IsoIgyTrAbWSiKXo+VNkrcKZsyE9a2mZZ5K11ItJOKJSJMCZXe3Ue2BGyEhWmjWcMopigfcw1JuWQ=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1x6FXR599IsoIgyTrAbWShN/KNY5215k/GQ+G03MwDwgueRhChxI2XiprcFeefueHVIzVLNAvrl48ar7TYuJL0=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Q8M/QNyyhQgbtZ5e/JFp0dX8gtRO9cYmco5pGVoregweAmixHTyKbClsTA5l/hq4YIRKoKK2RiTUafgJHexSB5j53jgDjUzUAa6mSgX2hWRFVZAptg6kyBwUxYNBNVgahgp9dYW/j+Ti0Fku+uNlk/WEe9oPXAuxelEWHWUFuCaPfuvb+4ncTX+G4od0FQPhwP8Ygv0ttH6moMXSt2HCpmz8ze7lE9JBSI4YqATKNGpyMZLtIkVH6AlHXYKhwEgLUh8ZmR3ChV6wmUrFa0Pak5ieLwRd/+Pwbf1Xptr8bExX3tbdolooEAA7zEqxf9pKh6U37lCKC6FEnEktoiy49iMN8jVVDK9IrO6ILAwjQhU</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RdCve+MBP+vGr9Ojys/Dpy/0XaeyVfd8iLs+7N+T9j/Tw8j1AEbfha0lhgnEbfqau99S4CDoMCOW2ks494Ql2fxLXvfwKT7SQ9gL1fLktUu97ITgs8FUJ1m7RR+PtvTGyVm9ruvLGUZORrKPhuX9SsMGXilPWIUThiNh8bD3gEfuLs3ac0UgTGMy9LCf/l0vKxmLh2e2n/fCtJq7JI4Fqm3lSldDfGsRvWiQdv1fw99</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2vpLH+kNMYbyZIS0GXebxL4/FK5m8vMjq4x3b4heAfQargPrY0w2RrXIrk94z9jK8YCR90lKPTrkzRC8qpiqWg=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jTKvWoBjp/59vNNa+96I+36gj2n26XmjoXkB+w63hTNKD+dElfbAL4NUcsWE3uLe7NOcFUn/V77vBLdsFf/7pucrSsiaZEYO9e/ibBK/BH0bGz9QUCf/B7HoQZB5C8IKTJ9PoPitmLnxELxm+EKEqfPi/0cTXT4XMLIOH8JYrR5k=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqhgTft8kCS6mWiXpWEhudfrpfuQJZCiR/90zJmIqPcu</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyIqoNosJ8rw/dIgXgiRb67rd+dH2+qMtSXRb+8gvJ/B0bJc8+iH6C3By6B7BQPwdIbVUTiYfQC0jITZtNcKtX5sK9AZ2JJJTsnBKrFF2be6Q6nhicQMaQUytufgC4kvEg==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Ghdw1ExDf0ScwOvcYF5QTWrSbW7Ctxed0+GmXC80cw3pgsiVpg1LwvoxrwCPvS8k71PujL5KretBwSg97xIJYnzh8Ij9tOA5+RYUkOwmxaZTz1vZIAEUB/MBiDsRX6CKPBZaXscHSSg1uOuhfXv90/a73lBWw8j03gT/VFRrmc1Vzkl6es7MBXcxg6XX6BqI514C0uTVCTFHtDPYTMap7kDmEfmE3KEHD4LdBjswFdkQGcCjC3WiJBcOZz8PfyIHM8DH5fHAtxUJpBFt4Wolf0Tz9ivoWXv2tpZR5VoxYd+QBTVsrvs6rg4wCxZpCjllqIgFGkb3IkqQWcnvXH8vktOkZNaHTpgEeSbJ2uOh2hbufWkOAXKpSzGJu36rSXW7fNXslAjRUgjL17E2/S/hao3kLk1Tm9kCNzPIefN+Djpl6wRjmM+ZfgYvoUfvQvS5k4B9rLlLRcIfRCYwClgCtK6/3/A3LcQeaul32u8sMSO</encrypted>]]>
    </text>
  </script>
</dir>