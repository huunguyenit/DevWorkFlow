<?xml version="1.0" encoding="utf-8"?>

<dir table="hrbhtdtt" code="stt_rec, ngay_hl" order="ma_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin" e="Labor’s Information"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZcer5eNR3Lxp/CNL+Jh9M3Ba3l16OxyNZ5LzKTJhlhXv89Apiii+J7+Evpi5mg5QeqfvxQ3DYOJKTvcSKG1a0OA=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tn_bhxhtn" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat">
      <header v="Tiền đóng BHXH" e="SI Contribution Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="pt_bhxhtn">
      <header v="Phương thức đóng" e="Payment Method"></header>
    </field>
    <field name="noi_dung_khac">
      <header v="Nội dung thay đổi" e="Content"></header>
    </field>
    <field name="ma_kcb">
      <header v="Nơi đăng ký KCB" e="Medical Care"></header>
      <items style="AutoComplete" controller="hrMedicalCareCenter" reference="ten_kcb%l" key="status ='1'" check="1=1" information="ma_kcb$hrdmkcb.ten_kcb%l"/>
    </field>
    <field name="ten_kcb%l" external="true" defaultValue="''" categoryIndex="1" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ho_so_gk">
      <header v="Hồ sơ gởi kèm" e="Including Document"></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực" e="Effective Date" />
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ho_ten]"/>
      <item value="110----: [tn_bhxhtn].Label, [tn_bhxhtn]"/>
      <item value="1100000: [pt_bhxhtn].Label, [pt_bhxhtn]"/>
      <item value="1100000: [noi_dung_khac].Label, [noi_dung_khac]"/>
      <item value="1101000: [ma_kcb].Label, [ma_kcb], [ten_kcb%l]"/>
      <item value="1100000: [ho_so_gk].Label, [ho_so_gk]"/>
      <item value="110---1: [ngay_hl].Label, [ngay_hl], [stt_rec]"/>
      <item value="1100000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcoZ9OJmCOxY6e+uX64BR+ZUk3M0oaR5qAxp9VyaDmsZsPE7Vh4f85RxtgtEbVYHV56NKAC5DF10gaaGf+fwSB3</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx2W5vIdtYlj0uB+9JIYJvs47wLBaMNUNjDdyjVTKIlwNcdjnntt4SiLYC/f7TL1VmmBaFLW797oYK3TenxRAzcwxij8TsvTXaKyVe7ViJmS</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9lgF7/4c35HfTr7iOxSHswHkjA0jwTiH0zeQBN3ruouK25aIxuCv8Ft3bR/32KZgWm5+N3pHuVY/Q/0Bum60EwHJ7q7Tnh6/vpkxu4uKexZiA9Mi+WgSgerhGh1nRin5w==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN3vBrHGkn2GaZD1DIPrH++gcUaiJwoiEZ8mPy5ZUHtbvOwLxaDZ0ip6vvULs7wujJup25crwJn+vQP0HFkZcRMo</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulil2dObfz1k/rcJPIez/DJCzsZ4KtvkBUbw8MFN8uu306qCMWuBQWJJkPgAdwIe3HScWUsDaV4iGExt/4rcbiBZ9wMeUAIhvyFVmwGiFVytqMV92/7HrMd7j9wdekXgOtBj2SXLyVRgHBOATwSF6zQF8MQZyBEZ+y3kFw88XayM7snee6htTRZJuOV7Lyx4Y5Z7PbLVmpQARLH3MlhwOm65BpCNFvDtgEW03/Kscq6Bwfn+RMCMPfRSy7MdNjHhB2Ghit6iuWiJ79SzReLuS1dBHrPbQih1LC8N4byMUVHdhDCVsCEaEhqhx6YQC7Gqo44Icv/L9jrBDrFlR8IWtbFpE5qwbd+J/P24jJfVERJPGI/XxJblFctOJ8D5a3YiMHuQKO6p26tfeKLWRcRjirI3hpyRo7LHLhkfFaiu6afp7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q286yu0Sq/c3EwEekBU5KD/FrB3MfxaZtj3tQmwmw/zNKeIMqlGdwsqe+QSoDXRzPuxPzN6bheC7kyNRcmxpOksaXGnnLCA3ci/myBfy9bMJXuqKbfwP8R4UspyhleIV22hcRr/1X98a4DC5b6rI6KXoGJXJK5CELG6mSFaaRJxQ6iIaCEibXslIAnk/wm2R61kxAnXGNT0OVmfnp0EqsBmj464WVy/2d8koXVVSYRwFr86kukHTWCP0fe22qlepWVg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jQk4zwK0lrw3EQTrbKSKixJsiihjCebbygUmgqFTWA7m1BMleXUsxHbpFEnPou5Gchim/AKoZ9ENe+urQjhbuX8rtdFn1QQhTrzpC0L8idPTyERlQlksVZjiTb61Q1s4YacbvwW9y8e3FFmrgwXpgHc2EM0yI7x3dR4ZkwxQt9VLapyC9v36n0k5kSA9mFVHplzmeBcpAdVj7IZCDPdwDRFfswDQDhLcAFz1tLQKiKhidnqsAuvDeRGKTIoyxLkWPp61mMyldrryekdMtrIEEC4NIAkxAtOuA3j0aQebXI1PK4qw8UO0zU3fJb82vOYmA</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgb7icautGPJhC8S3fSbZCfhJ3SZPmG/hi00cdPWMFFQ8w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYFb0KcCv6I+NN5zJy+pUYCoZtAxxYDv0vSH9LHJSAGySbMhj12b3z5VDyozkH50+y0HXxMW/8hWwIiY4QVF1ZI5GM9oMIpPrBObDn94/rBI6cxZJdWTWoylFGL16R8/MJ9TC5P+AsbQqAOwMiIrL+dmcXH6dtYyQVBh5XOmItTgknMCImhfPWMVPkWI57UZijAwl/kS99U4edbd/As8I/8CBv25l7EbVLIwPIJSULs5mm9YPxZYaD8fq6JzfoATm4qNsSFx97/9gfG9iDbxMajCEGZF92+WVcfSTuikQq9BX34Kh9LORLiF2RihzuuUo6K7yMb5LeP6JJWJyoXQjVMUXc1WLGj8RKh8hB2ToyXyihFUXOeiL6S5pTh+6Sz8GSJrcn5X6MBfmOrTs8LrGJ6g7NOPYHByW4xoPWomH2XEzD6V0PvBPzLjdiTRTGHGnUAmT5qL/1OmkoJcJlf5Mrl</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNe1NWZAFthZQVFXCS3ORqLbPILfY5lclrzI1lzkCB9izQcDmPERv+f/FcKknTu+wPw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>