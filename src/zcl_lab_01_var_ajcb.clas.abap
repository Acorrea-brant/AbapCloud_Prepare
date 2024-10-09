CLASS zcl_lab_01_var_ajcb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.

    "Definición de Constantes
    CONSTANTS: mc_purchase_date   TYPE d VALUE '20241005',
               mc_purchase_time   TYPE t VALUE '201500',
               mc_cust_id         TYPE i VALUE  '2045',
               mc_cust_customer   TYPE c LENGTH 15 VALUE 'Anthony Correa',
               mc_cust_age        TYPE i VALUE '36',
               mc_price           TYPE f VALUE '10.5',
               mc_tax             TYPE i VALUE '16',
               mc_increase        TYPE decfloat16 VALUE '20.5',
               mc_discounts       TYPE decfloat34 VALUE '10.5',
               mc_type            TYPE c LENGTH 10 VALUE 'PC',
               mc_shipping        TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36',
               mc_id_code         TYPE x LENGTH 5 VALUE 'F5FC',
               mc_client          TYPE c LENGTH 3 VALUE '100',
               mc_employee        TYPE /dmo/employee_id  VALUE '0001',
               mc_first_name      TYPE /dmo/first_name VALUE 'Juan Antonio',
               mc_last_name       TYPE /dmo/last_name VALUE 'Perez Delgado',
               mc_manager         TYPE /dmo/employee_id VALUE '2045',
               mc_salary          TYPE currencysap VALUE '2000',
               mc_salary_currency TYPE /dmo/currency_code VALUE 'USD',
               mc_product         TYPE string VALUE 'Laptop',
               mc_barcode         TYPE xstring VALUE '12121121211'.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS: elementary_data_type IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
             complex_data_type IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
             reference_data_type IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
             object_data_type IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
             constants_data_type IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
             inline_data_type IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.

CLASS zcl_lab_01_var_ajcb IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Manejo de datos elementales
    elementary_data_type( out ).

    "Manejo de datos complejos
    complex_data_type( out ).

    "Manejo de datos por referencia
    reference_data_type( out ).

    "Manejo de datos tipo objeto
    object_data_type( out ).

    "Manejo de datos con constantes
    constants_data_type( out ).

    "Manejo de datos por declaración en línea
    inline_data_type( out ).

  ENDMETHOD.

  METHOD elementary_data_type.
    "Definición de Variables
    DATA: mv_purchase_date TYPE d,
          mv_purchase_time TYPE t,
          mv_price         TYPE f VALUE '10.5',
          mv_tax           TYPE i VALUE '16',
          mv_increase      TYPE decfloat16 VALUE '20.5',
          mv_discounts     TYPE decfloat34 VALUE '10.5',
          mv_type          TYPE c LENGTH 10 VALUE 'PC',
          mv_shipping      TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36',
          mv_id_code       TYPE x LENGTH 5 VALUE 'F5FC'.


    "Asignación de valores
    mv_purchase_date = cl_abap_context_info=>get_system_date(  ).
    mv_purchase_time = cl_abap_context_info=>get_system_time(  ).

    "Impresión de variables
    out->write( |Impresión de Variables| ).
    out->write( |Variable mv_purchase_date: { mv_purchase_date DATE = USER }| ).
    out->write( |Variable mv_purchase_time: { mv_purchase_time TIME = USER }| ).
    out->write( |Variable mv_price: { mv_price  }| ).
    out->write( |Variable mv_tax: { mv_tax }| ).
    out->write( |Variable mv_increase: { mv_increase }| ).
    out->write( |Variable mv_discounts: { mv_discounts }| ).
    out->write( |Variable mv_type: { mv_type }| ).
    out->write( |Variable mv_shipping: { mv_shipping }| ).
    out->write( |Variable mv_id_code: { mv_id_code }| ).
  ENDMETHOD.
  METHOD complex_data_type.
    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.

    "Se asignan valores a la estructura
    DATA(ms_customer) = VALUE mty_customer( id       = 10
                                            customer = 'Anthony Correa'
                                            age      = 36 ).
    "Damos impresión a la estructura
    out->write( |Impresión de variable compleja (Estructura): | ).
    out->write( ms_customer ).

  ENDMETHOD.
  METHOD reference_data_type.
    DATA ms_employees TYPE REF TO /dmo/employee_hr.

    ms_employees = NEW #(  ).

    IF ms_employees IS BOUND.

      ms_employees->client          = '100'.
      ms_employees->employee        = '0001'.
      ms_employees->first_name      = 'Juan Antonio'.
      ms_employees->last_name       = 'Perez Delgado'.
      ms_employees->manager         = '2045'.
      ms_employees->salary          = '2000'.
      ms_employees->salary_currency = 'USD'.

    ENDIF.

    "Damos impresión
    out->write( |Impresión de variable de referencia (Estructura): | ).
    out->write( ms_employees ).

  ENDMETHOD.
  METHOD object_data_type.
    DATA: mv_product TYPE string VALUE 'Laptop',
          mv_barcode TYPE xstring VALUE '12121121211'.

    "Damos impresión de variables
    out->write( |Impresión de variables Objetos de Datos: | ).
    out->write( |Variable MV_PRODUCT: { mv_product }| ).
    out->write( |Variable MV_BARDCODE: { mv_barcode }| ).

  ENDMETHOD.
  METHOD constants_data_type.

    "Definición y asignación de valores a las Variables
    DATA(mv_purchase_date) = me->mc_purchase_date.
    DATA(mv_purchase_time) = me->mc_purchase_time.
    DATA(mv_price)         = me->mc_price.
    DATA(mv_tax)           = me->mc_tax.
    DATA(mv_increase)      = me->mc_increase.
    DATA(mv_discounts)     = me->mc_discounts.
    DATA(mv_type)          = me->mc_type.
    DATA(mv_shipping)      = me->mc_shipping.
    DATA(mv_id_code)       = me->mc_id_code.
    DATA(mv_product)       = me->mc_product.
    DATA(mv_barcode)       = me->mc_barcode.

    "Se asignan valores a la estructura
    DATA(ms_customer) = VALUE mty_customer( id       = me->mc_cust_id
                                            customer = me->mc_cust_customer
                                            age      = me->mc_cust_age ).

    DATA(ms_employees) = NEW /dmo/employee_hr( ).

    IF ms_employees IS BOUND.

      ms_employees->client          = me->mc_client.
      ms_employees->employee        = me->mc_employee.
      ms_employees->first_name      = me->mc_first_name.
      ms_employees->last_name       = me->mc_last_name.
      ms_employees->manager         = me->mc_manager.
      ms_employees->salary          = me->mc_salary.
      ms_employees->salary_currency = me->mc_salary_currency.

    ENDIF.

  ENDMETHOD.
  METHOD inline_data_type.

    DATA(mv_product)       = me->mc_product.
    DATA(mv_barcode)       = me->mc_barcode.

    "Damos impresión
    out->write( |Impresión de variables Inline: | ).
    out->write( |Variable MV_PRODUCT: { mv_product }| ).
    out->write( |Variable MV_BARDCODE: { mv_barcode }| ).

  ENDMETHOD.

ENDCLASS.
