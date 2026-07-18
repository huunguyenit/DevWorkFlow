<?xml version="1.0" encoding="utf-8"?>

<grid table="hrrmlichctuv" code="ma_dot, stt_rec0lich, ma_hs" order="tag desc, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60" allowContain="true">
      <header v="Chọn" e="Select"></header>
    </field>
    <field name="ma_hs" isPrimaryKey="true" width="100" allowNulls="false" readOnly="true" allowContain="true" aliasName="b">
      <header v="Mã ứng viên" e="Applicant ID"></header>
      <items style="AutoComplete" controller="hrRMApplicantProfileInput" reference="ten" key="(ma_dot = '{[$ma_dot]}') and (@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = vhrrmhs.ma_dvcs and r.r_access = 1))" check="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = vhrrmhs.ma_dvcs and r.r_access = 1))" information="ma_hs$vhrrmhs.ten%l"/>
    </field>
    <field name="ten" readOnly="true" external="true" defaultValue="''" inactivate="true" width="150" aliasName="b">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
      <handle key="[tag] == 1" field="tag"/>
    </field>

    <field name="ma_dot" isPrimaryKey="true" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0lich" isPrimaryKey="true" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_hs"/>
      <field name="ten"/>
      <field name="ghi_chu"/>
      <field name="ma_dot"/>
      <field name="stt_rec0lich"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8Y9Kmo3r7dEGu8ZT5LhovsLZOPmoksWX9Po7Cn1nyTMnLmnUvrAS1qMsMDysA9ZbnlcSHuC+xIegG8Jh5Tl1G9d9SsVrk+A3/hCVFoFQvG25t38Ap8jh+0jHU1xWccxf4Yeg8BvwClYNPIfM7ATXN5QciUiL67Qih7uHRnVQxdgFbqX8VVvhVIrCDj5xHGZbdPGozhy6ahMO265wxrhJDA/SNu7A0WFpDeRwj5n2mVVC9vNdy6Gx7qzrOngL9VWtR+4F+XZZ4OOeiS8c6/30TY1KrDl5I4sTdTwXosCbycJaZvzpKa+0HvaGPYaVJ1A6mC3vuS/XrBOxSNj05udE3S0gBe447h8sUNpicx0s9QD</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>

    <button command="">
      <title v="-" e="-"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>