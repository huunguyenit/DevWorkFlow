<?xml version="1.0" encoding="utf-8"?>

<dir table="hrghphep" code="ma_bp, nam_hl" order="ma_bp, nam_hl, thang, ngay" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo chuyển phép sang năm sau" e="Carried Forward Annual Leave"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="Int32" dataFormatString="#0">
      <header v="Ngày giới hạn" e="Due Day"></header>
      <footer v="Ngày/tháng giới hạn" e="Due Day/Month"></footer>
      <items style="Numeric"/>
    </field>
    <field name="thang" type="Int32" dataFormatString="#0">
      <header v="Tháng giới hạn" e="Due Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="##0.00">
      <header v="Số ngày tối đa" e="Maximum Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam_hl" isPrimaryKey="true" type="Int32" dataFormatString="###0" allowNulls="false">
      <header v="Năm hiệu lực" e="Effective Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_thang" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_ref" readOnly="true" external="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 50, 50, 25, 75, 100, 130, 0"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111----1: [ngay].Description, [ngay], [thang], [ngay_thang]"/>
      <item value="110----1: [so_ngay].Label, [so_ngay], [stt_ref]"/>
      <item value="110: [nam_hl].Label, [nam_hl]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNWabHT7BUD8v+iRDte3+7rLc6Ve8j65RhTPpDBElqbQ15QcHuli822zyTHh8hqvUy7yA9VnA0uPHkuSYIAKA1s3rZLqDupEeXbAApT2Z3Ry</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLf9bPnM5K2Nuj+y5IM9zPBi2T1aj55bEC2r+txlzn9WQ6Sfdb3D65vDQJimyf7K8fPSAmXYDX47xCtiAz5pi/R6nXeuSM42TcOxke6itbG4</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAvAs9w3fl/SxCIwalcjrXLm0dEBB9m7syuB/OBuaZisuJOWXeDhb0fxZWffZFKgAdiwOKzrFYtuUNWad9PYOvTNUgNHaDdFzNtIzNY+54Tw</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI+saNVRqO0lcJc+E/2wzD8rwWXCzlE36EQfvY4ftrVh1p4r8PClkZJ+oV8Fu2X8WmJM0C/XnWneeKfkicH3vvl3J/vmg2wg3w2QRAx8fnhn6TAwH9sxjg3ZfZK88avNfU7fDJu3/ZO9wZCzH0PtxFt3zMOu90JAC2v6lC1o1V+yizFn+tJPppcaKq1PPvzCw9nDdZbnuxg7Pa2aZVBwt4pinAkyngRRl1Ht2RSMkhRtVHWm+Y1eVx01x44JRkn0XeqcwGf0tg0Ps1hQw6ABoC4F/WWA+jYiOcEmP2fLUxbeLS0w1MNvLNbIayKMctVz54shiqVQmew97rtvWNCOgsnJT2Lxdfl3RQvFtWiSssmJUxEPGHwBCduI4Ed0IeDHHf</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBchg4I2aL0cZxTyYmdXk/XBNgtXs/8N1MVPleZat9PsQpjw/qgoqJ8g2G8lRYTYmwVclADmyd5SsdxauxsBCXyD/W4OdLGjd7e3rUggltyg</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CzoAFK10yNhWcRKAwZalZZs7mx8loCCV1JUvQuSJg7Dw/F3zx/IBOU+8nc9dQSOYJjhf579SVczTanswygkKtSusxZrNx90U5CMzyA01G6m9RvWruUTynHbNkKaJENwZds3Njq36G4fyyce+CRlGj+TjDacNb+NYv0VV1IQn4a09oP88CerTedP8QckKLp00bBbwLnCawVy8jdJ5FYQHQvg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteAbFs3q3d11pfO1HZrizbjZVJDq4OJVdJ8FSMg4fVyrp7BZhgYNS348GQdg6et/GRoJk7WkRIcntIkMeBKVYo8H0ctnSFBHfvRvUM+BeDhwFf95dKWeInxeETvN0VDfXpb+0EDgHj7av+1ydhcm2u1jCmvRTR1mpVNxgLBpSqDZY7JYM3qh2XcWUpGHjN+5AVweIVurSpgLHN4MU8JbW1lWQoz74ZubQlqol1uO0sJnssxmAw6cKs3TcDxRY/192eRK5pdFcOd4cPD4A4/A+4Dw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV2sprgI+U2RBp41S5VlmEzSKmeCzlmtNV5G3aIuEwbdX</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ETDP0fFgdMH4sA3YUXTSCLvhXxn5x6P3dGDiqlQMjF1HFYfZU0U397Us9EZVBG9R4/i9qBCC/wx/gwZ3b9xxmxnLXYo709+JXsvgU0ihO19aJIcV03oFYlqn56rP9ckTDT6kdBoiYXDbuE/W9JfZ0B0=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRwdtwOUVv7WrSR8Z3YztA3INU2MzZqCl9DIK6u1599oAqYKX3H1JcS5xDKUPG7TK9hL4TRNBr4DswjQ0dHmo7/7g0DEHtjBA80lw8pErE5V+uqQ2vK2et7qr0EL0mU4LDraCEZyBvP8EH30YY5i7UslJErGn9DJl7wVJqngUNIMDEoBQ3fIJ6bnzJGGaWySHDpzQvcDD+VRF90sAAiXTzIfi8N5YA0G+Pym9rki35K/AkrMuwqiig801W50tb958J6TyyjDKi/cjNBMg8FdIPBAA24Zwrq800BNwL5A0El8PYvSi/qMaj7p2clem7dJgA1MY8b5S1uf/zCjsAWlv/uii/A9syOaxFJlFw8mPXV7uR7WvmXnQiioUxvRUqGTEyJxEheY2OZwjjY8OQBs1NuwjwENdveugG9BBauN2LkV4sTmJL1GtkHCJqDAyPQne98a6xvyFaqaRCX6Ugt6lpAJsQmrrzAytMgtNSu+t0m5BStG//zz+wJfpZ1vxJxYqdQENOYvCdO+s+t9M09L+1k5skyIVcpWiGYpC9iA+de6Pd5rABiKYW1OnKQk4cCa3ZGPWsx5pNaJ5QAhOCKxtHx7ksHoDF4OiBosmjmPIlKDhUXfOQ2aF/mEQ6C9NWeRSMT4paazKmeJ66rAgPff4jsCN49qwarmRdncL7SRX/QgPEOkqU/lu2/oJXjcufe2xlViXJNeXAJqzCoB9QkVkU0Gk1ciwKrQ44mQwk0sDdx6ATIPi8O7KdUr5PAIyhNBBbfVt32Of4pbAxUpp9tmgkPXluLKGsZAvStBBkzmGuQlaepHeu5bR6Ep7H39YKpLcC4qbjZevretZfvAoxY6XIbr62veVqyDW37sdnFr3AOyWtQ5/5gTM4T+IvB1P82JkA==</Encrypted>]]>
    </text>
  </script>
</dir>