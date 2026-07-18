<?xml version="1.0" encoding="utf-8"?>

<grid table="hrkbctdgct" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" allowNulls="false" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" readOnly="true" width="60" inactivate="true" clientDefault="1">
      <header v="Stt" e="No."></header>
    </field>
    <field name="chi_tieu" allowNulls="false" width="300">
      <header v="Chỉ tiêu" e="Criterion"></header>
    </field>
    <field name="muc_tieu" type="Decimal" dataFormatString="@markInputFormat" width="100" clientDefault="0">
      <header v="Mục tiêu" e="Objective"></header>
      <items style="Numeric"/>
    </field>
    <field name="trong_so" type="Decimal" dataFormatString="@markInputFormat" width="100" clientDefault="0">
      <header v="Trọng số" e="Weight"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_loai" width="100">
      <header v="Loại chỉ tiêu" e="Criterion Type"></header>
      <items style="AutoComplete" controller="hrAMCriterionType" reference="ten_loai%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt0" readOnly="true" hidden="true" width="0" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="bac" type="Int32" hidden="true" width="0" allowContain="true" clientDefault="1">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" width="0" allowContain="true" clientDefault="1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="chi_tieu"/>
      <field name="muc_tieu"/>
      <field name="trong_so"/>
      <field name="dien_giai"/>
      <field name="ma_loai"/>
      <field name="ten_loai%l"/>
      <field name="stt0"/>
      <field name="bac"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wrWi8pJlhwAPjE28fpr3/afNlMUffCKTWmjcJgYrG4iM2K5s5yveho5BT0TDDvuqku0K0fuuK2kF/QJeXvUS2k=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752FxNr+eTcY27nKbOj4ny6TTKJmKLXzqrnYYOUhDEuwEo3tc4dqfPYVE8Rr11dYTwnIUMvjVUzNKGkXCIVh0bQ4=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteUAe7/XrB1upPOeWwhxC63giKlvuag+i2wEhmtFpra7mGgleZinfdSejLnZKBJakmAoMC8QUkboIVPJEEPmZyhzhSRtb8DyBBlBdgCKnWM1cemgo1N+YOHckbSicAzPacb64lBL4wCJCTZKlx02ZnJSWZQZf4QILG9PB2beJzJY3g0rdDOOTUJgnnuejpDemJc3/XQDgcjlfATkh5g3FPh/1/amBxsbEeY7xdSV8TlbJvxWkagIP/VzrtQ3BuQ4q/BG0CV0r/0fFhrJ47TYkkT4fDYjgwjVpiX0nOT1YoJWMEcBgKLTHXtXl8geFn77ZiwALZbMTLP+dPq54/wim4FnVI4F+OkrY1FIgH7zzVtrXmzKZL3vBSxQPfyGnZ/0ZgJ03y8YVZpp74o8mHDvSk/tIXVHR3yZCP2XvYe9OOUP+DpiLNMle0DTSfSWEg6q/TYB/Wt6er7zwAaCV0rAvp5NAYRlBsecg3iR5y+tsMy0JBTiB2uiXDK6ahYNG4gEHtqJFeyT/j4YTrah6OkcKX3aHFhAAeI1OKlUiRSOmmfzNj1BFju3f7zg+iq17WhJiMTrvOGgtLvmmmK6yzBowqE9Vwkb0rybwx+9I64I6Ys/Ify6gHTqjgXPzkcsih3HCP8/LeIXybUVbUZDlc75Z9CxaRdSnxF/+0ufoEZPJ2m8zbx2k9N9DIqELqLge/sfHJBkohYGlBfuOt+EtyblG8wzRHashfsncNKpy2xZXaWw8rqVXhKbdGzSGvxWPTErYsS1G0XCDzDYN/YAjM3Lk8rXCDUnNf3hyJU9BoAOO0jkg3rkxuSG92AjJb5tyZPDRKavBW0Icff1GGEjILdjZNsNDVjSs4ZaoQeyjlEkGZ26t+evYr7Q8RH+/1WBm8T1OPxNulvF/lI47QsbjxzBczbuPg2b089xEQJTUZR1pW/FIkYXShDnhGLwI3W8KFPRMEputCKK5eMUN8VqK9BgrGhgeHJmRv2mDacGcvFZTdc/HcSAEjMg3hZFIg2wy8HMTwIgQc6Gg4VgDy2zxhTAJAp1j6KnYQPcCHpjrLuJ+colQ9ixRvRmznTnJ464mzYN1TcF9syPMoqzguKOHgJL0oQSaoPhH5xvcpPW9hjWcUw/dyvzUt62A7sUt85z2lowbfWGlWtL2ZlnbitvNjkKlRJaoNCP2ORPowjcDofx8ozxu8FzD8haKFvJOo2ZfyatO2LVCf2AZtiJ3Dz+TNCiETpiDHuHi/ngw55HLa+rpMSFsBCLybvOvWNuZ/Vl3m+lsXCkRB3ZGjMr/yaANuxCPZTARKDdVJoIY/3eV0xECZ7tfacxOfw+rmM2mcOkO6FX6+aq0fvV/cNr3jnirIHa/2f7tcP6vRwcM41cwNjiJ+KGQhqRowxQwyebJiTlOsbAc/bszPVUD+hX2ihBsFlb8+Y=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK8zVBBiUqG+TCHqLZlhW67o82eXQzkSrnK4ns3tvZiDgcXz4t+U1M2T020RYAhAT8EZ3Tk1NYqZN3g/JgLKsKuz</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyCSgIi9rXc1i1FJAPV+kgOtEZ0APiF8Swy3rBiTp8I6UoP3Ikcyr2ANj4hZsxQrSbBIxMv1wDxPLOroIQMmx97ZCv76d/l0Wr+TCWThEHRdhR8/difpQY4iBlfXD5Nlg20efi5bCuYBwzfqf6l4mI831FxUUOIdgz1KE/jQUc5rz2IVhrpLQJNP4JGZLhDTFQ==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Indent">
      <title v="Thay đổi bậc$$90" e="Swap Level$$90"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>